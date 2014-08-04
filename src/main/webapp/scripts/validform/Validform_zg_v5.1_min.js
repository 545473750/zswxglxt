(function($,win,undef)
{
	var errorobj=null,//指示当前验证失败的表单元素;
		msgobj=null,//pop box object 
		msghidden=true; //msgbox hidden?

	var tipmsg={//默认提示文字;
		tit:"提示信息",
		w:"请输入正确信息！",
		r:"通过信息验证！",
		c:"正在检测信息…",
		s:"请填写完整再提交！",
		v:"所填信息没有经过验证，请稍后…",
		p:"正在提交数据…",
		err:"出错了！请检查提交地址或返回数据格式是否正确！",
		abort:"Ajax操作被取消！"
	}
	
	$.Tipmsg=tipmsg;
		
	var Validform=function(forms,settings,inited)
	{
		var settings=$.extend({},Validform.defaults,settings);
		settings.datatype && $.extend(Validform.util.dataType,settings.datatype);
		
		var brothers=this;
		brothers.tipmsg={};
		brothers.settings=settings;
		brothers.forms=forms;
		brothers.objects=[];
		
		//创建子对象时不再绑定事件;
		if(inited===true){
			return false;	
		}
		//初始化提示信息
		forms.each(function(n){
			var $this=$(this);
			Validform.util.initTipMessage($this,settings.tiptype);
		});
		
		forms.each(function(n){
			
			var $this=$(this);
			
			//防止表单按钮双击提交两次;
			this.status="normal"; //normal | posting | posted;
			
			//让每个Validform对象都能自定义tipmsg;	
			$this.data("tipmsg",brothers.tipmsg);

			//bind the blur event;
			$this.find("[datatype]").live("blur",function(){
				//判断是否是在提交表单操作时触发的验证请求；
				var subpost=arguments[1];
				var inputval=Validform.util.getValue.call($this,$(this));
				
				//绑定了dataIgnore属性的对象也忽略验证;
				//dragonfly=true时，值为空不做验证;
				if($(this).data("dataIgnore")==="dataIgnore" || settings.dragonfly && !$(this).data("cked") && Validform.util.isEmpty.call($(this),inputval) ){
					return false;
				}
				
				var flag=true,
					_this;
				errorobj=_this=$(this);

				flag=Validform.util.regcheck.call($this,$(this).attr("datatype"),inputval,$(this));
				if(!flag.passed){
					//取消正在进行的ajax验证;
					Validform.util.abort.call(_this[0]);
					_this.addClass("Validform_error");
					Validform.util.showmsg.call($this,flag.info,settings.tiptype,{obj:$(this),type:flag.type,sweep:settings.tipSweep},"hide"); //当tiptype=1的情况下，传入"hide"则让提示框不弹出,tiptype=2的情况下附加参数"hide"不起作用;
				}else{
					if($(this).attr("ajaxurl")){
						var inputobj=$(this);
						if(inputobj[0].valid==="posting"){return false;}
						
						inputobj[0].valid="posting";
						Validform.util.showmsg.call($this,brothers.tipmsg.c||tipmsg.c,settings.tiptype,{obj:inputobj,type:1,sweep:settings.tipSweep},"hide");
						
						Validform.util.abort.call(_this[0]);
						_this[0].ajax=$.ajax({
							type: "POST",
							cache:false,
							url: inputobj.attr("ajaxurl"),
							data: "param="+inputval+"&name="+$(this).attr("name"),
							dataType: "text",
							success: function(s){
								if($.trim(s)=="y"){
									inputobj[0].valid="true";
									Validform.util.showmsg.call($this,brothers.tipmsg.r||tipmsg.r,settings.tiptype,{obj:inputobj,type:2,sweep:settings.tipSweep},"hide");
									_this.removeClass("Validform_error");
									errorobj=null;
									if(subpost==="postform"){
										$this.trigger("submit");
									}
								}else{
									inputobj[0].valid=s;
									_this.addClass("Validform_error");
									Validform.util.showmsg.call($this,s,settings.tiptype,{obj:inputobj,type:3,sweep:settings.tipSweep});
								}
								_this[0].ajax=null;
							},
							error: function(){
								inputobj[0].valid=brothers.tipmsg.err || tipmsg.err;
								_this.addClass("Validform_error");
								_this[0].ajax=null;
								Validform.util.showmsg.call($this,brothers.tipmsg.err||tipmsg.err,settings.tiptype,{obj:inputobj,type:3,sweep:settings.tipSweep});	
							}
						});
					}else{
						Validform.util.showmsg.call($this,flag.info,settings.tiptype,{obj:$(this),type:flag.type,sweep:settings.tipSweep},"hide");
						_this.removeClass("Validform_error");
						errorobj=null;
					}
				}

			});
			
			//点击表单元素，默认文字消失效果;
			//Validform.util.hasDefaultText.call($this);
			
			//表单元素值比较时的信息提示增强;
			Validform.util.recheckEnhance.call($this);
			
			//plugins here to start;
			if(settings.usePlugin){
				Validform.util.usePlugin.call($this,settings.usePlugin,settings.tiptype,settings.tipSweep,n);
			}
			
			//enhance info feedback for checkbox & radio;
			$this.find(":checkbox[datatype],:radio[datatype]").each(function(){
				var _this=$(this);
				var name=_this.attr("name");
				$this.find("[name='"+name+"']").filter(":checkbox,:radio").bind("click",function(){
					//避免多个事件绑定时的取值滞后问题;
					setTimeout(function(){
						_this.trigger("blur");
					},0);
				});
				
			});
			
			settings.btnSubmit && $this.find(settings.btnSubmit).bind("click",function(){
				var subflag=Validform.util.submitForm.call($this,settings);
				subflag === undef && (subflag=true);
				if(subflag===true){
					$this[0].submit();
				}
			});
						
			$this.submit(function(){
				var subflag=Validform.util.submitForm.call($this,settings);
				subflag === undef && (subflag=true);
				return subflag;
			});
			
			$this.find("[type='reset']").add($this.find(settings.btnReset)).bind("click",function(){
				Validform.util.resetForm.call($this);
			});
			
		});
		
		//预创建pop box;
		if( settings.tiptype==1 || (settings.tiptype==2 && settings.ajaxPost) ){		
			creatMsgbox();
		}
	}
	
	
	Validform.defaults={
		tiptype:2,
		tipSweep:false,
		showAllError:false,
		postonce:false,
		ajaxPost:false
	}
	
	Validform.util={
		dataType:{
			"match":/^(.+?)(\d+)-(\d+)$/,
			"*":function(gets,obj,curform,regxp){
					return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"*");
			},
			"*6-16":/^[\w\W]{6,16}$/,
			"number":function(gets,obj,curform,regxp){
					return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"number");
			},
			"number6-16":/^\d{6,16}$/,
			"string":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"string");
			},
			"string6-18":/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]{6,18}$/,
			"chinese": function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"chinese");
			},
			"chinese6-18":/^[\u4E00-\u9FA5\uf900-\ufa2d]{6,18}$/,
			"post":/^[0-9]{6}$/,
			"mobile":/^13[0-9]{9}$|15[0-9]{9}$|18[0-9]{9}$/,
			"email":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"email");
			},
			"url":function(gets,obj,curform,regxp){
					return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"url");
			},
			"english":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"english");
			},
			"double":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"double");
			},
			"money":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"money");
			},
			"group":function(gets,obj,curform,regxp){
						return Validform.util.groupValid.call($(this),gets,obj,curform,regxp);	
					},
			"phone":/^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/,
			"idcard":function(gets,obj,curform,regxp){
						return Validform.util.idcardValid.call($(this),gets,obj,curform,regxp);
					},
			"date":function(gets,obj,curform,regxp){
						return Validform.util.dateValid.call($(this),gets,obj,curform,regxp);
					},
			"integer":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"integer");
					},
			"regexp":function(gets,obj,curform,regxp){
						return Validform.util.customValid.call($(this),gets,obj,curform,regxp,"regexp");
					}
		},
		
		toString:Object.prototype.toString,
		
		
		//自定义验证
		customValid:function(gets,obj,curform,regxp,dataType){
			var dataTypeReg="";
			if(dataType=="money")
			{
				dataTypeReg=RegExp(/^\d+(\.\d+)?$/);
				return Validform.util.floatValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="regexp")
			{
				var rexp = $(obj).attr("regexp");
				var value = $(obj).val();
				dataTypeReg=RegExp(rexp, "g");
				return dataTypeReg.test(value);
			}
			
			if(dataType=="double")
			{
				dataTypeReg=RegExp(/^[-\+]?\d+(\.\d+)?$/);
				return Validform.util.floatValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="english")
			{
				dataTypeReg=RegExp(/^[A-Za-z]+$/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="url")
			{
				dataTypeReg=RegExp(/^(\w+:\/\/)?\w+(\.\w+)+.*$/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="email")
			{
				dataTypeReg=RegExp(/^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]*$/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="chinese")
			{
				dataTypeReg=RegExp(/^[\u4E00-\u9FA5\uf900-\ufa2d]$/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="string")
			{
				dataTypeReg=RegExp(/^[\u4E00-\u9FA5\uf900-\ufa2d\w\.\s]+$/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="number")
			{
				dataTypeReg=RegExp(/^\d+$/);
				return Validform.util.floatValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="*")
			{
				dataTypeReg=RegExp(/[\w\W]+/);
				return Validform.util.lengthValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			
			if(dataType=="integer")
			{
				dataTypeReg=RegExp(/^[-\+]?\d+$/);
				return Validform.util.integerValid.call($(this),gets,obj,curform,regxp,dataTypeReg);
			}
			return true;
		},
		//浮点型数据验证
		floatValid:function(gets,obj,curform,regxp,dataTypeReg)
		{
			var objValue=obj.attr("value");
			var pass=dataTypeReg.test(objValue);
			if(!pass)
			{
				return pass;
			}
			var min=obj.attr("min");
			var max=obj.attr("max");
			var decimal=obj.attr("decimal");//小数位数
			var varray=objValue.split(".");//判断是否有小数位
			
			//当第一位为+号时，不通过
			if(objValue.substr(0,1)=="+")
			{
				return false;
			}
			
			//当无小数位，且第一位为0时
			if(objValue.substr(0,1)==0&&varray.length==1&&objValue.length>1)
			{
				return false;
			}
			//当有小数位，且第二位不为小数点时
			if(objValue.substr(0,1)==0&&varray.length>1&&objValue.substr(1,1)!=".")
			{
				return false;
			}
			
			if(decimal!=null)
			{
				if(varray[1]!=null)
				{
					if(varray[1].length>decimal)
					{
						return "不能超过"+decimal+"位小数";
					}
				}
			}
			
			if(max==null&&min==null){ 
			
				return pass;
			}
			
			if(min!=null&&max==null)
			{
				if(objValue<parseFloat(min))
				{
					return "不能小于"+min;
				}
				return true;
			}
			if(min==null&&max!=null)
			{
				if(objValue>parseFloat(max))
				{
					return "不能大于"+max;
				}
					return true;
			}
			if(min!=null&&max!=null)
			{
				if(parseFloat(min)<=objValue&&objValue<=parseFloat(max))
				{
					return true;
				}else
				{
					return "值必须在"+min+"-"+max+"之间";
				}
			}
			
		},
		//整型验证
		integerValid:function(gets,obj,curform,regxp,dataTypeReg)
		{
			var objValue=obj.attr("value");
			var pass=dataTypeReg.test(objValue);
			var min=obj.attr("min")||-2147483648;
			var max=obj.attr("max")||2147483647;
			if(!pass)
			{
				return pass;
			}
			if(objValue.substr(0,1)=="+")
			{
				return false;
			}
			if(objValue.substr(0,1)==0&&objValue.length>1)
			{
				return false;
			}
			if(parseInt(min)<=objValue&&objValue<=parseInt(max))
			{
				return true;
			}else
			{
				return "值必须在"+min+"-"+max+"之间";
			}
		},
		//长度验证
		lengthValid:function(gets,obj,curform,regxp,dataTypeReg)
		{
			var objValue=obj.attr("value");
			var pass=dataTypeReg.test(objValue);
			if(!pass)
			{
				return pass;
			}
			var min=obj.attr("min");
			var max=obj.attr("max");
			
			if(max==null&&min==null){ 
				return pass;
			}
			if(min!=null&&max==null)
			{
				if(objValue.length<parseInt(min))
				{
					return "长度不能小于"+min;
				}
				return true;
			}
			if(min==null&&max!=null)
			{
				if(objValue.length>parseInt(max))
				{
					return "长度不能大于"+max;
				}
					return true;
			}
			
			if(min!=null&&max!=null)
			{
				if(parseInt(min)<=objValue.length&&objValue.length<=parseInt(max))
				{
					return true;
				}else
				{
					return "内容长度必须在"+min+"-"+max+"之间";
				}
			}
			
		},
		//组验证
		groupValid:function(gets,obj,curform,regxp)
		{
			var max=obj.attr("max");
			var min=obj.attr("min");
			if(max==null){
				max=0;
			}
			if(min==null){
				min=0;
			}
			if(max==0&&min==0){
				return true;
			}
			numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
			if(parseInt(min)>0&&parseInt(max)>0){
				if(numselected>=min&&numselected<=max){
					return  true;
				}
				return  "请至少选择"+min+"项，请至多选择"+max+"项！";
			}
			if(parseInt(min)>0){
				return  numselected >= min ? true : "请至少选择"+min+"项！";
			}
			if(parseInt(max)>0){
				return  numselected <= max ? true : "请至多选择"+max+"项！";
			}
			
			return  true;
		},
		
		//身份证验证
		idcardValid:function(gets,obj,curform,regxp)
		{
			//该方法由佚名网友提供;
			var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子;
			var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值，10代表X;
		
			if (gets.length == 15) {   
				return isValidityBrithBy15IdCard(gets);   
			}else if (gets.length == 18){   
				var a_idCard = gets.split("");// 得到身份证数组   
				if (isValidityBrithBy18IdCard(gets)&&isTrueValidateCodeBy18IdCard(a_idCard)) {   
					return true;   
				}   
				return false;
			}
			return false;
			
			function isTrueValidateCodeBy18IdCard(a_idCard) {   
				var sum = 0; // 声明加权求和变量   
				if (a_idCard[17].toLowerCase() == 'x') {   
					a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
				}   
				for ( var i = 0; i < 17; i++) {   
					sum += Wi[i] * a_idCard[i];// 加权求和   
				}   
				valCodePosition = sum % 11;// 得到验证码所位置   
				if (a_idCard[17] == ValideCode[valCodePosition]) {   
					return true;   
				}
				return false;   
			}
			
			function isValidityBrithBy18IdCard(idCard18){   
				var year = idCard18.substring(6,10);   
				var month = idCard18.substring(10,12);   
				var day = idCard18.substring(12,14);   
				var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
				// 这里用getFullYear()获取年份，避免千年虫问题   
				if(temp_date.getFullYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
					return false;   
				}
				return true;   
			}
			
			function isValidityBrithBy15IdCard(idCard15){   
				var year =  idCard15.substring(6,8);   
				var month = idCard15.substring(8,10);   
				var day = idCard15.substring(10,12);
				var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
				// 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
				if(temp_date.getYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
					return false;   
				}
				return true;
			}
		},
		
		
		//日期验证
		dateValid:function(gets,obj,curform,regxp)
		{
			objValue=obj.attr("value");
			dateReg=/^(\d{4})\-(\d{2})\-(\d{2})$/;//年-月-日
			dateHourReg=/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})$/;//年-月-日 小时
			dateHourMinuteReg=/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2})$/;//年-月-日 小时:分
			dateHourMinuteSecondReg=/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;//年-月-日 小时:分:秒
			if(!dateReg.test(objValue)&&!dateHourReg.test(objValue)&&!dateHourMinuteReg.test(objValue)&&!dateHourMinuteSecondReg.test(objValue))
			{
				return false;
			}
			
			var min=obj.attr("min");
			var max=obj.attr("max");
			if(max==null&&min==null){ 
				return true;
			}
			if(min!=null&&max==null)
			{
				if(Date.parse(objValue)-Date.parse(min)<0)
				{
					return "日期不能小于"+min;
				}
				return true;
			}
			if(min==null&&max!=null)
			{
				if(Date.parse(objValue)-Date.parse(max)>0)
				{
					return "日期不能大于"+max;
				}
				return true;
			}
			if(min!=null&&max!=null)
			{
				if(Date.parse(objValue)-Date.parse(max)>0||Date.parse(objValue)-Date.parse(min)<0)
				{
					return "日期必须在"+min+"-"+max+"之间";
				}else
				{
					return true;
				}
			}
		},
	
		
		
		getValue:function(obj){
			var inputval,
				curform=this;
				
			if(obj.is(":radio")){
				inputval=curform.find(":radio[name='"+obj.attr("name")+"']:checked").val();
				inputval= inputval===undef ? "" : inputval;
			}else if(obj.is(":checkbox")){
				inputval=curform.find(":checkbox[name='"+obj.attr("name")+"']:checked").val();
				inputval= inputval===undef ? "" : inputval;
			}else{
				inputval=obj.val();
			}
			return $.trim(inputval);
		},
		
		isEmpty:function(val){
			return val==="" || val===$.trim(this.attr("tip"));
		},
		
		recheckEnhance:function(){
			var curform=this;
			curform.find("input[recheck]").each(function(){
				var _this=$(this);
				var recheckinput=curform.find("input[name='"+$(this).attr("recheck")+"']");
				recheckinput.bind("keyup",function(){
					if(recheckinput.val()==_this.val() && recheckinput.val() != ""){
						if(recheckinput.attr("tip")){
							if(recheckinput.attr("tip") == recheckinput.val()){return false;}
						}
						_this.trigger("blur");
					}
				}).bind("blur",function(){
					if(recheckinput.val()!=_this.val() && _this.val()!=""){
						if(_this.attr("tip")){
							if(_this.attr("tip") == _this.val()){return false;}	
						}
						_this.trigger("blur");
					}
				});
			});
		},
		
		hasDefaultText:function()
		{
			this.find("[tip]").each(function()
			{
				//tip是表单元素的默认提示信息,这是点击清空效果;
				var defaultvalue=$(this).attr("tip");
				var altercss=$(this).attr("altercss");
				$(this).focus(function()
				{
					if($(this).val()==defaultvalue)
					{
						$(this).val('');
						if(altercss)
						{
							$(this).removeClass(altercss);
						}
					}
				}).blur(function()
				{
					if($.trim($(this).val())==='')
					{
						$(this).val(defaultvalue);
						if(altercss)
						{
							$(this).addClass(altercss);
						}
					}
				});
			});
		},
		
		usePlugin:function(plugin,tiptype,tipSweep,n){
			/*
				plugin:settings.usePlugin;
				tiptype:settings.tiptype;
				tipSweep:settings.tipSweep;
				n:当前表单的索引;
			*/
			
			var curform=this;
			//swfupload;
			if(plugin.swfupload){
				var swfuploadinput=curform.find("input[plugin='swfupload']").val(""),
					custom={
						custom_settings:{
							form:curform,
							showmsg:function(msg,type){
								Validform.util.showmsg.call(curform,msg,tiptype,{obj:swfuploadinput,type:type,sweep:tipSweep});	
							}	
						}	
					};

				custom=$.extend(true,{},plugin.swfupload,custom);
				if(typeof(swfuploadhandler) != "undefined"){swfuploadhandler.init(custom,n);}
				
			}
			
			//datepicker;
			if(plugin.datepicker){
				if(plugin.datepicker.format){
					Date.format=plugin.datepicker.format; 
					delete plugin.datepicker.format;
				}
				if(plugin.datepicker.firstDayOfWeek){
					Date.firstDayOfWeek=plugin.datepicker.firstDayOfWeek; 
					delete plugin.datepicker.firstDayOfWeek;
				}
				
				var datepickerinput=curform.find("input[plugin='datepicker']");
				plugin.datepicker.callback && datepickerinput.bind("dateSelected",function(){
					var d=new Date( $.event._dpCache[this._dpId].getSelected()[0] ).asString(Date.format);
					plugin.datepicker.callback(d,this);
				});
				
				datepickerinput.datePicker(plugin.datepicker);
			}
			
			//passwordstrength;
			if(plugin.passwordstrength){
				plugin.passwordstrength.showmsg=function(obj,msg,type){
					Validform.util.showmsg.call(curform,msg,tiptype,{obj:obj,type:type,sweep:tipSweep},"hide");
				};
				curform.find("input[plugin*='passwordStrength']").passwordStrength(plugin.passwordstrength);
			}
			
			//jqtransform;
			if(plugin.jqtransform){
				var jqTransformHideSelect = function(oTarget){
					var ulVisible = $('.jqTransformSelectWrapper ul:visible');
					ulVisible.each(function(){
						var oSelect = $(this).parents(".jqTransformSelectWrapper:first").find("select").get(0);
						//do not hide if click on the label object associated to the select
						if( !(oTarget && oSelect.oLabel && oSelect.oLabel.get(0) == oTarget.get(0)) ){$(this).hide();}
					});
				};
				
				/* Check for an external click */
				var jqTransformCheckExternalClick = function(event) {
					if ($(event.target).parents('.jqTransformSelectWrapper').length === 0) { jqTransformHideSelect($(event.target)); }
				};
				
				var jqTransformAddDocumentListener = function (){
					$(document).mousedown(jqTransformCheckExternalClick);
				};
				
				if(plugin.jqtransform.selector){
					curform.find(plugin.jqtransform.selector).filter('input:submit, input:reset, input[type="button"]').jqTransInputButton();
					curform.find(plugin.jqtransform.selector).filter('input:text, input:password').jqTransInputText();			
					curform.find(plugin.jqtransform.selector).filter('input:checkbox').jqTransCheckBox();
					curform.find(plugin.jqtransform.selector).filter('input:radio').jqTransRadio();
					curform.find(plugin.jqtransform.selector).filter('textarea').jqTransTextarea();
					if(curform.find(plugin.jqtransform.selector).filter("select").length > 0 ){
						 curform.find(plugin.jqtransform.selector).filter("select").jqTransSelect();
						 jqTransformAddDocumentListener();
					}
					
				}else{
					curform.jqTransform();
				}
				
				curform.find(".jqTransformSelectWrapper").find("li a").click(function(){
					curform.find("select").trigger("blur");	
				});
			}

		},

		regcheck:function(datatype,gets,obj){
			/*
				datatype:datatype;
				gets:inputvalue;
				obj:input object;
			*/
			var curform=this,
				info=null,
				passed=false,
				type=3;//default set to wrong type, 2,3,4;
				
			//ignore;
			if(obj.attr("ignore")==="ignore" && Validform.util.isEmpty.call(obj,gets)){				
				if(obj.data("cked")){
					info="";	
				}
				
				return {
					passed:true,
					type:4,
					info:info
				};
			}

			obj.data("cked","cked");//do nothing if is the first time validation triggered;

			//default value;
			if($.trim(obj.attr("tip")) && gets===$.trim(obj.attr("tip")) ){
				return {
					passed:false,
					type:3,
					info:obj.attr("nullmsg") || curform.data("tipmsg").s || tipmsg.s
				};
			}
			
			if(Validform.util.toString.call(Validform.util.dataType[datatype])=="[object Function]"){
				passed=Validform.util.dataType[datatype](gets,obj,curform,Validform.util.dataType);
				if(passed === true){
					type=2;
					info=curform.data("tipmsg").r||tipmsg.r;
					if(obj.attr("recheck")){
						var theother=curform.find("input[name='"+obj.attr("recheck")+"']:first");
						if(gets!=theother.val()){
							passed=false;
							type=3;
							info=obj.attr("errormsg")  || curform.data("tipmsg").w || tipmsg.w;
						}
					}
					
				}else{
					info= passed || obj.attr("errormsg") || curform.data("tipmsg").w || tipmsg.w;
					passed=false;
					if(gets===""){//验证不通过且为空时;
						return {
							passed:false,
							type:3,
							info:obj.attr("nullmsg") || curform.data("tipmsg").s || tipmsg.s
						};
					}
				}
				
				return {
					passed:passed,
					type:type,
					info:info
				};
				
			}

			if(!(datatype in Validform.util.dataType)){
				var mac=datatype.match(Validform.util.dataType["match"]),
					temp;
					
				if(!mac){
					return false;
				}

				for(var name in Validform.util.dataType){
					temp=name.match(Validform.util.dataType["match"]);
					if(!temp){continue;}
					if(mac[1]===temp[1]){
						var str=Validform.util.dataType[name].toString(),
							param=str.match(/\/[mgi]*/g)[1].replace("\/",""),
							regxp=new RegExp("\\{"+temp[2]+","+temp[3]+"\\}","g");
    			        str=str.replace(/\/[mgi]*/g,"\/").replace(regxp,"{"+mac[2]+","+mac[3]+"}").replace(/^\//,"").replace(/\/$/,"");
				        Validform.util.dataType[datatype]=new RegExp(str,param);
						break;
					}	
				}
			}

			if(Validform.util.toString.call(Validform.util.dataType[datatype])=="[object RegExp]"){
				passed=Validform.util.dataType[datatype].test(gets);
				if(passed){
					type=2;
					info=curform.data("tipmsg").r||tipmsg.r;
					
					if(obj.attr("recheck")){
						var theother=curform.find("input[name='"+obj.attr("recheck")+"']:first");
						if(gets!=theother.val()){
							passed=false;
							type=3;
							info=obj.attr("errormsg") || curform.data("tipmsg").w || tipmsg.w;
						}
					}
					
				}else{
					info=obj.attr("errormsg") || curform.data("tipmsg").w || tipmsg.w;
					
					if(gets===""){
						return {
							passed:false,
							type:3,
							info:obj.attr("nullmsg") || curform.data("tipmsg").s || tipmsg.s
						};
					}
				}

				return {
					passed:passed,
					type:type,
					info:info
				};
			}

			return{
					passed:false,
					type:3,
					info:curform.data("tipmsg").w || tipmsg.w
			};
			
		},

		showmsg:function(msg,type,o,show){
			/*
				msg:提示文字;
				type:提示信息显示方式;
				o:{obj:当前对象, type:1=>正在检测 | 2=>通过}, 
				show:在blur或提交表单触发的验证中，有些情况不需要显示提示文字，如自定义弹出提示框的显示方式，不需要每次blur时就马上弹出提示;
			*/
			
			//如果msg为null，那么就没必要执行后面的操作，ignore有可能会出现这情况;
			if(msg===null){return false;}
			//if(msg===null || o.sweep && show=="hide"){return false;}

			$.extend(o,{curform:this});
			
			//自定义方法模式
			if(typeof type == "function"){
				if(!(o.sweep && show=="hide")){
					type(msg,o,Validform.util.cssctl);
				}
				return false;
			}
			//弹出信息模式
			if(type==1 || show=="alwaysshow"){
				msgobj.find(".Validform_info").html(msg);
			}
			if(type==1 && show!="hide" || show=="alwaysshow"){
				msghidden=false;
				msgobj.find(".iframe").css("height",msgobj.outerHeight());
				
				setCenter(msgobj,100);
				msgobj.show();
			}
			//右侧显示模式
			if(type==2 && o.obj){
				o.obj.parent().find(".Validform_checktip").html(msg);
				Validform.util.cssctl(o.obj.parent().find(".Validform_checktip"),o.type);
			}
			//右上侧提示框模式  新增加
			if(type==3 && o.obj){
				Validform.util.showMessageByTip(msg,o,Validform.util.cssctl);
			}

		},
		

		cssctl:function(obj,status){
			switch(status){
				case 1:
					obj.removeClass("Validform_right Validform_wrong").addClass("Validform_checktip Validform_loading");//checking;
					break;
				case 2:
					obj.removeClass("Validform_wrong Validform_loading").addClass("Validform_checktip Validform_right");//passed;
					break;
				case 4:
					obj.removeClass("Validform_right Validform_wrong Validform_loading").addClass("Validform_checktip");//for ignore;
					break;
				default:
					obj.removeClass("Validform_right Validform_loading").addClass("Validform_checktip Validform_wrong");//wrong;
			}
		},
		
		submitForm:function(settings,flg,ajaxPost,sync){
			/*
				flg===true时跳过验证直接提交;
				ajaxPost==="ajaxPost"指示当前表单以ajax方式提交;
			*/
			var curform=this;
			
			//表单正在提交时点击提交按钮不做反应;
			if(curform[0].status==="posting"){return false;}
			
			//要求只能提交一次时;
			if(settings.postonce && curform[0].status==="posted"){return false;}
			
			var sync= sync===true ? false:true;
			var beforeCheck=settings.beforeCheck && settings.beforeCheck(curform);
			if(beforeCheck===false){return false;}
			
			var flag=true,
				inflag;

			curform.find("[datatype]").each(function(){
				//跳过验证;
				if(flg){
					return false;	
				}

				//隐藏或绑定dataIgnore的表单对象不做验证;
				if(settings.ignoreHidden && $(this).is(":hidden") || $(this).data("dataIgnore")==="dataIgnore"){
					return true;
				}
				
				var inputval=Validform.util.getValue.call(curform,$(this)),
					_this;
				errorobj=_this=$(this);
				
				inflag=Validform.util.regcheck.call(curform,$(this).attr("datatype"),inputval,$(this));

				if(!inflag.passed){
					_this.addClass("Validform_error");
					Validform.util.showmsg.call(curform,inflag.info,settings.tiptype,{obj:$(this),type:inflag.type,sweep:settings.tipSweep});
					
					if(!settings.showAllError){
						_this.focus();
						flag=false;
						return false;
					}
					
					flag && (flag=false);
					return true;
				}

				if($(this).attr("ajaxurl")){
					if(this.valid!=="true"){
						var thisobj=$(this);
						_this.addClass("Validform_error");
						Validform.util.showmsg.call(curform,curform.data("tipmsg").v||tipmsg.v,settings.tiptype,{obj:thisobj,type:3,sweep:settings.tipSweep});
						if(!msghidden || settings.tiptype!=1){
							setTimeout(function(){
								thisobj.trigger("blur",["postform"]);//continue the form post;
							},1500);
						}
						
						if(!settings.showAllError){
							flag=false;
							return false;
						}
						
						flag && (flag=false);
						return true;
					}
				}

				Validform.util.showmsg.call(curform,inflag.info,settings.tiptype,{obj:$(this),type:inflag.type,sweep:settings.tipSweep},"hide");
				_this.removeClass("Validform_error");
				errorobj=null;
			});
			
			if(settings.showAllError){
				curform.find(".Validform_error:first").focus();
			}

			if(flag){
				
				var beforeSubmit=settings.beforeSubmit && settings.beforeSubmit(curform);
				if(beforeSubmit===false){return false;}
				
				curform[0].status="posting";
				
				if(settings.ajaxPost || ajaxPost==="ajaxPost"){
					Validform.util.showmsg.call(curform,curform.data("tipmsg").p||tipmsg.p,settings.tiptype,{obj:curform,type:1,sweep:settings.tipSweep},"alwaysshow");//传入"alwaysshow"则让提示框不管当前tiptye为1还是2都弹出;
					curform[0].ajax=$.ajax({
						type: "POST",
						dataType:"json",
						async:sync,
						url: curform.attr("action"),
						//data: decodeURIComponent(curform.serialize(),true),
						data: curform.serializeArray(),
						success: function(data){
							if(data.status==="y"){
								Validform.util.showmsg.call(curform,data.info,settings.tiptype,{obj:curform,type:2,sweep:settings.tipSweep},"alwaysshow");
							}else{
								curform[0].posting=false;
								Validform.util.showmsg.call(curform,data.info,settings.tiptype,{obj:curform,type:3,sweep:settings.tipSweep},"alwaysshow");
							}
							
							settings.callback && settings.callback(data);
							
							curform[0].status="posted";
							curform[0].ajax=null;
						},
						error: function(data){
							var msg=data.statusText==="abort" ? 
									curform.data("tipmsg").abort||tipmsg.abort : 
									curform.data("tipmsg").err||tipmsg.err;
									
							curform[0].posting=false;
							Validform.util.showmsg.call(curform,msg,settings.tiptype,{obj:curform,type:3,sweep:settings.tipSweep},"alwaysshow");
							curform[0].status="normal";
							curform[0].ajax=null;
						}
					});
					
				}else{
					if(!settings.postonce){
						curform[0].status="normal";
					}
					return settings.callback && settings.callback(curform);
				}
			}
			
			return false;
			
		},
		
		resetForm:function(){
			var brothers=this;
			brothers.each(function(){
				this.reset();
				this.status="normal";
			});
			
			brothers.find(".Validform_right").text("");
			brothers.find(".passwordStrength").children().removeClass("bgStrength");
			brothers.find(".Validform_checktip").removeClass("Validform_wrong Validform_right Validform_loading");
			brothers.find(".Validform_error").removeClass("Validform_error");
			brothers.find("[datatype]").removeData("cked").removeData("dataIgnore");
			brothers.eq(0).find("input:first").focus();
		},
		
		abort:function(){
			if(this.ajax){
				this.ajax.abort();	
			}
		},
		//新增加方法，以右上角提示模式显示信息
		showMessageByTip:function(msg,o,cssctl)
		{
			if(!o.obj.is("form"))
			{
					var objtip=o.obj.parent().find(".Validform_checktip");
					cssctl(objtip,o.type);
					objtip.text(msg);
					var infoObj=o.obj.parent().find(".Validform_tipinfo");
					if(o.type==2){
						infoObj.fadeOut(200);
					}else{
						if(infoObj.is(":visible")){return;}
						var left=o.obj.offset().left,
							top=o.obj.offset().top;
						infoObj.css({
							left:left+105,
							top:top-45
						}).show().animate({
							top:top-35	
						},200);
					}
					
			}	
		},
		//新增加方法，初始化提示信息
		initTipMessage:function(form,tipType)
		{
		
			//给所有的输入框增加输入提示
			$("[datatype]").focusin(function()
			{
				//焦点获得时触发
				var $this=$(this);
				//清除错误提示框
				var errorTipObj=$this.parent().find(".Validform_tipinfo");
				if(errorTipObj.is(":visible"))
				{
					errorTipObj.fadeOut(200);
				}
				//获得提示消息
				var msg=$.trim($this.attr("tip"));
				if(msg==null||msg=="")
				{
					msg=$.trim($this.attr("nullmsg"));
					if(msg==null||(msg && msg==""))
					{
						msg=$.trim($this.attr("errormsg"));
					}
				}
				var objtip=$this.parent().find(".Validform_inputTipInfoText");
				objtip.text(msg);
				var infoObj=$this.parent().find(".Validform_inputTipInfo");
				if(infoObj.is(":visible"))
				{
					return;
				}
				var left=$this.offset().left;
				var	top=$this.offset().top;
				//infoObj.css({ left:left, top:top-45 }).show().animate({ top:top-35},200);//上方显示
				infoObj.css({ left:left, top:top+25 }).show().animate({ top:top+25},200);//下方显示
			}).focusout(function()
			{
				//焦点失去时触发
				var $this=$(this);
				var infoObj=$this.parent().find(".Validform_inputTipInfo");
				if(infoObj.is(":visible"))
				{
					infoObj.fadeOut(200);
				}
			});
		
		
			
			form.find("[datatype]").each(function()
			{
				var $this=$(this);
				var checkTip=$.trim($this.attr("tip"));
				if(checkTip==null||checkTip=="")
				{
					checkTip=$.trim($this.attr("nullmsg"));
					if(checkTip==null||checkTip=="")
					{
						checkTip=$.trim($this.attr("errormsg"));
					}
				}
				
				//给未添加tip的datatype对象增加默认的tip数据
				if($.trim($this.attr("tip"))==''&&checkTip!='')
				{
					$this.attr("tip",checkTip);
				}
				//当自己定义有自己的提示信息时，则使用自己的提示信息，否则使用系统自动计算出来的信息
				if($this.parent().find(".Validform_checktip").length==0)
				{
					if(checkTip!=null||checkTip!="")
					{
						if(tipType==1||tipType==2)
						{
							$this.parent().append('<span class="Validform_checktip">'+checkTip+'</span>');
						
						}else if(tipType==3)
						{
							$this.parent().append('<div class="Validform_tipinfo"><span class="Validform_checktip"></span><span class="Validform_dec"><s class="Validform_dec1">&#9670;</s><s class="Validform_dec2">&#9670;</s> </span></div>');
						}
						//友好输入提示信息
						//$this.parent().append('<div class="Validform_inputTipInfo"><span class="Validform_inputTipInfoText"></span><span class="Validform_inputTipDec"><s class="Validform_inputTipDec1">&#9670;</s><s class="Validform_inputTipDec2">&#9670;</s></span></div>');
					}
				}
				
			})
		}
		
	}
	
	$.Datatype=Validform.util.dataType;
	
	Validform.prototype={
		dataType:Validform.util.dataType,
		
		eq:function(n){
			var obj=this;
			
			if(n>=obj.forms.length){
				return null;	
			}
			
			if(!(n in obj.objects)){
				obj.objects[n]=new Validform($(obj.forms[n]).get(),obj.settings,true);
			}
			
			return obj.objects[n];

		},
		
		resetStatus:function()
		{
			var obj=this;
			$(obj.forms).each(function()
			{
				this.status="normal";	
			});
			
			return this;
		},
		
		setStatus:function(status)
		{
			var obj=this;
			$(obj.forms).each(function(){
				this.status=status || "posting";	
			});
		},
		
		getStatus:function()
		{
			var obj=this;
			var status=$(obj.forms)[0].status;
			return status;
		},
		
		ignore:function(selector)
		{
			var obj=this;
			$(obj.forms).find(selector).each(function()
			{
				$(this).data("dataIgnore","dataIgnore").removeClass("Validform_error");
			});
		},
		
		unignore:function(selector)
		{
			var obj=this;
			$(obj.forms).find(selector).each(function()
			{
				$(this).removeData("dataIgnore");
			});
		},
		
		addRule:function(rule)
		{
			/*
				rule => [{
					ele:"#id",
					datatype:"*",
					errormsg:"出错提示文字！",
					nullmsg:"为空时的提示文字！",
					tip:"默认显示的提示文字",
					altercss:"gray",
					ignore:"ignore",
					ajaxurl:"valid.php",
					recheck:"password",
					plugin:"passwordStrength"
				},{},{},...]
			*/
			var obj=this;
			var rule=rule || [];
			for(var index in rule)
			{
				var o=$(obj.forms).find(rule[index].ele);
				for(var attr in rule[index])
				{
					attr !=="ele" && o.attr(attr,rule[index][attr]);
				}
			}
			
		},
		
		ajaxPost:function(flag,sync)
		{
			var obj=this;
			//创建pop box;
			if( obj.settings.tiptype==1 || obj.settings.tiptype==2 )
			{
				creatMsgbox();
			}
			Validform.util.submitForm.call($(obj.forms[0]),obj.settings,flag,"ajaxPost",sync);
		},
		
		submitForm:function(flag)
		{
			/*flag===true时不做验证直接提交*/
			var obj=this;
			//让该对象的第一个表单提交;
			var subflag=Validform.util.submitForm.call($(obj.forms[0]),obj.settings,flag);
			subflag === undef && (subflag=true);
			if(subflag===true)
			{
				obj.forms[0].submit();
			}
		},
		
		resetForm:function()
		{
			var obj=this;
			Validform.util.resetForm.call($(obj.forms));
		},
		
		abort:function()
		{
			var obj=this;
			$(obj.forms).each(function()
			{
				Validform.util.abort.call(this);
			});	
		}
	}

	$.fn.Validform=function(settings)
	{
		return new Validform(this,settings);
	};
	
	function setCenter(obj,time)
	{
		var left=($(window).width()-obj.outerWidth())/2,
			top=($(window).height()-obj.outerHeight())/2,
			
		top=(document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)+(top>0?top:0);

		obj.css({
			left:left	
		}).animate({
			top : top
		},{ duration:time , queue:false });	
	}
	
	function creatMsgbox()
	{
		if($("#Validform_msg").length!==0){return false;}
		msgobj=$('<div id="Validform_msg"><div class="Validform_title">'+tipmsg.tit+'<a class="Validform_close" href="javascript:void(0);">&chi;</a></div><div class="Validform_info"></div><div class="iframe"><iframe frameborder="0" scrolling="no" height="100%" width="100%"></iframe></div></div>').appendTo("body");//提示信息框;
		msgobj.find("a.Validform_close").click(function()
		{
			msgobj.hide();
			msghidden=true;
			if(errorobj)
			{
				errorobj.focus().addClass("Validform_error");
			}
			return false;
		}).focus(function(){this.blur();});

		$(window).bind("scroll resize",function()
		{
			!msghidden && setCenter(msgobj,400);
		});
	};
	
	//公用方法显示&关闭信息提示框;
	$.Showmsg=function(msg){
		creatMsgbox();
		Validform.util.showmsg.call(win,msg,1,{});
	};
	
	$.Hidemsg=function()
	{
		msgobj.hide();
		msghidden=true;
	};
	
})(jQuery,window);