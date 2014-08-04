/*
 * Compressed by JSA(www.xidea.org)
 */
var Prototype = {
	Version : "only-for-rapid-validation",
	BrowserFeatures : {
		XPath : !!document.evaluate
	},
	ScriptFragment : "(?:<script.*?>)((\n|\r|.)*?)(?:</script>)",
	emptyFunction : function() {
	},
	K : function($) {
		return $
	}
}, Class = {
	create : function() {
		return function() {
			this.initialize.apply(this, arguments)
		}
	}
}, Abstract = new Object();
Object.extend = function(A, $) {
	for ( var _ in $)
		A[_] = $[_];
	return A
};
Object.extend(Object, {
	inspect : function(_) {
		try {
			if (_ === undefined)
				return "undefined";
			if (_ === null)
				return "null";
			return _.inspect ? _.inspect() : _.toString()
		} catch ($) {
			if ($ instanceof RangeError)
				return "...";
			throw $
		}
	},
	clone : function($) {
		return Object.extend( {}, $)
	}
});
Function.prototype.bind = function() {
	var $ = this, _ = $A(arguments), A = _.shift();
	return function() {
		return $.apply(A, _.concat($A(arguments)))
	}
};
Function.prototype.bindAsEventListener = function(A) {
	var $ = this, _ = $A(arguments), A = _.shift();
	return function(B) {
		return $.apply(A, [ (B || window.event) ].concat(_).concat(
				$A(arguments)))
	}
};
var Try = {
	these : function() {
		var A;
		for ( var C = 0, B = arguments.length; C < B; C++) {
			var $ = arguments[C];
			try {
				A = $();
				break
			} catch (_) {
			}
		}
		return A
	}
};
String.interpret = function($) {
	return $ == null ? "" : String($)
};
Object
		.extend(
				String.prototype,
				{
					gsub : function(B, _) {
						var $ = "", A = this, C;
						while (A.length > 0)
							if (C = A.match(B)) {
								$ += A.slice(0, C.index);
								$ += String.interpret(_(C));
								A = A.slice(C.index + C[0].length)
							} else
								$ += A, A = "";
						return $
					},
					strip : function() {
						return this.replace(/^\s+/, "").replace(/\s+$/, "")
					},
					stripScripts : function() {
						return this.replace(new RegExp(
								Prototype.ScriptFragment, "img"), "")
					},
					extractScripts : function() {
						var $ = new RegExp(Prototype.ScriptFragment, "img"), _ = new RegExp(
								Prototype.ScriptFragment, "im");
						return (this.match($) || []).map(function($) {
							return ($.match(_) || [ "", "" ])[1]
						})
					},
					evalScripts : function() {
						return this.extractScripts().map(function(script) {
							return eval(script)
						})
					},
					toQueryParams : function(_) {
						var $ = this.strip().match(/([^?#]*)(#.*)?$/);
						if (!$)
							return {};
						return $[1]
								.split(_ || "&")
								.inject(
										{},
										function(_, $) {
											if (($ = $.split("="))[0]) {
												var A = decodeURIComponent($[0]), B = $[1] ? decodeURIComponent($[1])
														: undefined;
												if (_[A] !== undefined) {
													if (_[A].constructor != Array)
														_[A] = [ _[A] ];
													if (B)
														_[A].push(B)
												} else
													_[A] = B
											}
											return _
										})
					},
					camelize : function() {
						var _ = this.split("-"), A = _.length;
						if (A == 1)
							return _[0];
						var $ = this.charAt(0) == "-" ? _[0].charAt(0)
								.toUpperCase()
								+ _[0].substring(1) : _[0];
						for ( var B = 1; B < A; B++)
							$ += _[B].charAt(0).toUpperCase()
									+ _[B].substring(1);
						return $
					},
					escapeHTML : function() {
						var _ = document.createElement("div"), $ = document
								.createTextNode(this);
						_.appendChild($);
						return _.innerHTML
					},
					toArray : function() {
						return this.split("")
					},
					capitalize : function() {
						return this.charAt(0).toUpperCase()
								+ this.substring(1).toLowerCase()
					},
					inspect : function(_) {
						var $ = this.replace(/\\/g, "\\\\");
						if (_)
							return "\"" + $.replace(/"/g, "\\\"") + "\"";
						else
							return "'" + $.replace(/'/g, "\\'") + "'"
					}
				});
String.prototype.parseQuery = String.prototype.toQueryParams;
var $break = new Object(), $continue = new Object(), Enumerable = {
	each : function(_) {
		var $ = 0;
		try {
			this._each(function(B) {
				try {
					_(B, $++)
				} catch (A) {
					if (A != $continue)
						throw A
				}
			})
		} catch (A) {
			if (A != $break)
				throw A
		}
		return this
	},
	all : function(_) {
		var $ = true;
		this.each(function(B, A) {
			$ = $ && !!(_ || Prototype.K)(B, A);
			if (!$)
				throw $break
		});
		return $
	},
	any : function(_) {
		var $ = false;
		this.each(function(B, A) {
			if ($ = !!(_ || Prototype.K)(B, A))
				throw $break
		});
		return $
	},
	collect : function($) {
		var _ = [];
		this.each(function(B, A) {
			_.push(($ || Prototype.K)(B, A))
		});
		return _
	},
	findAll : function($) {
		var _ = [];
		this.each(function(B, A) {
			if ($(B, A))
				_.push(B)
		});
		return _
	},
	include : function($) {
		var _ = false;
		this.each(function(A) {
			if (A == $) {
				_ = true;
				throw $break
			}
		});
		return _
	},
	pluck : function(_) {
		var $ = [];
		this.each(function(B, A) {
			$.push(B[_])
		});
		return $
	},
	inject : function(_, $) {
		this.each(function(B, A) {
			_ = $(_, B, A)
		});
		return _
	},
	toArray : function() {
		return this.map()
	},
	zip : function() {
		var $ = Prototype.K, _ = $A(arguments);
		if (typeof _.last() == "function")
			$ = _.pop();
		var A = [ this ].concat(_).map($A);
		return this.map(function(B, _) {
			return $(A.pluck(_))
		})
	},
	inspect : function() {
		return "#<Enumerable:" + this.toArray().inspect() + ">"
	}
};
Object.extend(Enumerable, {
	map : Enumerable.collect,
	find : Enumerable.detect,
	select : Enumerable.findAll,
	member : Enumerable.include,
	entries : Enumerable.toArray
});
var $A = Array.from = function(A) {
	if (!A)
		return [];
	if (A.toArray)
		return A.toArray();
	else {
		var $ = [];
		for ( var B = 0, _ = A.length; B < _; B++)
			$.push(A[B]);
		return $
	}
};
Object.extend(Array.prototype, Enumerable);
if (!Array.prototype._reverse)
	Array.prototype._reverse = Array.prototype.reverse;
Object.extend(Array.prototype, {
	_each : function($) {
		for ( var A = 0, _ = this.length; A < _; A++)
			$(this[A])
	},
	last : function() {
		return this[this.length - 1]
	},
	clear : function() {
		this.length = 0;
		return this
	},
	flatten : function() {
		return this.inject( [], function(_, $) {
			return _.concat($ && $.constructor == Array ? $.flatten() : [ $ ])
		})
	},
	reject : function($) {
		var _ = [];
		this.each(function(B, A) {
			if (!$(B, A))
				_.push(B)
		});
		return _
	},
	invoke : function(_) {
		var $ = $A(arguments).slice(1);
		return this.map(function(A) {
			return A[_].apply(A, $)
		})
	},
	without : function() {
		var $ = $A(arguments);
		return this.select(function(_) {
			return !$.include(_)
		})
	}
});
Array.prototype.toArray = Array.prototype.clone;
var Hash = function($) {
	Object.extend(this, $ || {})
};
Object.extend(Hash, {
	toQueryString : function(_) {
		var $ = [];
		this.prototype._each.call(_, function(A) {
			if (!A.key)
				return;
			if (A.value && A.value.constructor == Array) {
				var _ = A.value.compact();
				if (_.length < 2)
					A.value = _.reduce();
				else {
					var B = encodeURIComponent(A.key);
					_.each(function(_) {
						_ = _ != undefined ? encodeURIComponent(_) : "";
						$.push(B + "=" + encodeURIComponent(_))
					});
					return
				}
			}
			if (A.value == undefined)
				A[1] = "";
			$.push(A.map(encodeURIComponent).join("="))
		});
		return $.join("&")
	}
});
Object.extend(Hash.prototype, Enumerable);
Object.extend(Hash.prototype, {
	_each : function($) {
		for ( var B in this) {
			var A = this[B];
			if (A && A == Hash.prototype[B])
				continue;
			var _ = [ B, A ];
			_.key = B;
			_.value = A;
			$(_)
		}
	}
});
function $H($) {
	if ($ && $.constructor == Hash)
		return $;
	return new Hash($)
}
var Ajax = {
	getTransport : function() {
		return Try.these(function() {
			return new XMLHttpRequest()
		}, function() {
			return new ActiveXObject("Msxml2.XMLHTTP")
		}, function() {
			return new ActiveXObject("Microsoft.XMLHTTP")
		}) || false
	},
	activeRequestCount : 0
};
Ajax.Responders = {
	responders : [],
	_each : function($) {
		this.responders._each($)
	},
	dispatch : function(B, A, _, $) {
		this.each(function(D) {
			if (typeof D[B] == "function") {
				try {
					D[B].apply(D, [ A, _, $ ])
				} catch (C) {
				}
			}
		})
	}
};
Object.extend(Ajax.Responders, Enumerable);
Ajax.Base = function() {
};
Ajax.Base.prototype = {
	setOptions : function($) {
		this.options = {
			method : "post",
			asynchronous : true,
			contentType : "application/x-www-form-urlencoded",
			encoding : "UTF-8",
			parameters : ""
		};
		Object.extend(this.options, $ || {});
		this.options.method = this.options.method.toLowerCase();
		if (typeof this.options.parameters == "string")
			this.options.parameters = this.options.parameters.toQueryParams()
	}
};
Ajax.Request = Class.create();
Ajax.Request.Events = [ "Uninitialized", "Loading", "Loaded", "Interactive",
		"Complete" ];
Ajax.Request.prototype = Object
		.extend(
				new Ajax.Base(),
				{
					_complete : false,
					initialize : function($, _) {
						this.transport = Ajax.getTransport();
						this.setOptions(_);
						this.request($)
					},
					request : function(B) {
						this.url = B;
						this.method = this.options.method;
						var A = this.options.parameters;
						if (! [ "get", "post" ].include(this.method)) {
							A["_method"] = this.method;
							this.method = "post"
						}
						A = Hash.toQueryString(A);
						if (A
								&& /Konqueror|Safari|KHTML/
										.test(navigator.userAgent))
							A += "&_=";
						if (this.method == "get" && A)
							this.url += (this.url.indexOf("?") > -1 ? "&" : "?")
									+ A;
						try {
							Ajax.Responders.dispatch("onCreate", this,
									this.transport);
							this.transport.open(this.method.toUpperCase(),
									this.url, this.options.asynchronous);
							if (this.options.asynchronous)
								setTimeout(function() {
									this.respondToReadyState(1)
								}.bind(this), 10);
							this.transport.onreadystatechange = this.onStateChange
									.bind(this);
							this.setRequestHeaders();
							var $ = this.method == "post" ? (this.options.postBody || A)
									: null;
							this.transport.send($);
							if (!this.options.asynchronous
									&& this.transport.overrideMimeType)
								this.onStateChange()
						} catch (_) {
							this.dispatchException(_)
						}
					},
					onStateChange : function() {
						var $ = this.transport.readyState;
						if ($ > 1 && !(($ == 4) && this._complete))
							this.respondToReadyState(this.transport.readyState)
					},
					setRequestHeaders : function() {
						var $ = {
							"X-Requested-With" : "XMLHttpRequest",
							"X-Prototype-Version" : Prototype.Version,
							"Accept" : "text/javascript, text/html, application/xml, text/xml, */*"
						};
						if (this.method == "post") {
							$["Content-type"] = this.options.contentType
									+ (this.options.encoding ? "; charset="
											+ this.options.encoding : "");
							if (this.transport.overrideMimeType
									&& (navigator.userAgent
											.match(/Gecko\/(\d{4})/) || [ 0,
											2005 ])[1] < 2005)
								$["Connection"] = "close"
						}
						if (typeof this.options.requestHeaders == "object") {
							var C = this.options.requestHeaders;
							if (typeof C.push == "function") {
								for ( var B = 0, A = C.length; B < A; B += 2)
									$[C[B]] = C[B + 1]
							} else
								$H(C).each(function(_) {
									$[_.key] = _.value
								})
						}
						for ( var _ in $)
							this.transport.setRequestHeader(_, $[_])
					},
					success : function() {
						return !this.transport.status
								|| (this.transport.status >= 200 && this.transport.status < 300)
					},
					respondToReadyState : function(C) {
						var B = Ajax.Request.Events[C], A = this.transport, _ = this
								.evalJSON();
						if (B == "Complete") {
							try {
								this._complete = true;
								(this.options["on" + this.transport.status]
										|| this.options["on"
												+ (this.success() ? "Success"
														: "Failure")] || Prototype.emptyFunction)
										(A, _)
							} catch ($) {
								this.dispatchException($)
							}
							if ((this.getHeader("Content-type") || "text/javascript")
									.strip()
									.match(
											/^(text|application)\/(x-)?(java|ecma)script(;.*)?$/i))
								this.evalResponse()
						}
						try {
							(this.options["on" + B] || Prototype.emptyFunction)
									(A, _);
							Ajax.Responders.dispatch("on" + B, this, A, _)
						} catch ($) {
							this.dispatchException($)
						}
						if (B == "Complete")
							this.transport.onreadystatechange = Prototype.emptyFunction
					},
					getHeader : function(_) {
						try {
							return this.transport.getResponseHeader(_)
						} catch ($) {
							return null
						}
					},
					evalJSON : function() {
						try {
							var json = this.getHeader("X-JSON");
							return json ? eval("(" + json + ")") : null
						} catch (e) {
							return null
						}
					},
					evalResponse : function() {
						try {
							return eval(this.transport.responseText)
						} catch (e) {
							this.dispatchException(e)
						}
					},
					dispatchException : function($) {
						(this.options.onException || Prototype.emptyFunction)(
								this, $);
						Ajax.Responders.dispatch("onException", this, $)
					}
				});
function $prototype($) {
	if (arguments.length > 1) {
		for ( var B = 0, A = [], _ = arguments.length; B < _; B++)
			A.push($prototype(arguments[B]));
		return A
	}
	if (typeof $ == "string")
		$ = document.getElementById($);
	return Element.extend($)
}
if (Prototype.BrowserFeatures.XPath)
	document._getElementsByXPath = function($, C) {
		var _ = [], A = document.evaluate($, $prototype(C) || document, null,
				XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
		for ( var D = 0, B = A.snapshotLength; D < B; D++)
			_.push(A.snapshotItem(D));
		return _
	};
document.getElementsByClassName = function(C, E) {
	if (Prototype.BrowserFeatures.XPath) {
		var _ = ".//*[contains(concat(' ', @class, ' '), ' " + C + " ')]";
		return document._getElementsByXPath(_, E)
	} else {
		var B = ($prototype(E) || document.body).getElementsByTagName("*"), D = [], $;
		for ( var F = 0, A = B.length; F < A; F++) {
			$ = B[F];
			if (Element.hasClassName($, C))
				D.push(Element.extend($))
		}
		return D
	}
};
if (!window.Element)
	var Element = new Object();
Element.extend = function(_) {
	if (!_ || _nativeExtensions || _.nodeType == 3)
		return _;
	if (!_._extended && _.tagName && _ != window) {
		var $ = Object.clone(Element.Methods), A = Element.extend.cache;
		if (_.tagName == "FORM")
			Object.extend($, Form.Methods);
		if ( [ "INPUT", "TEXTAREA", "SELECT" ].include(_.tagName))
			Object.extend($, Form.Element.Methods);
		Object.extend($, Element.Methods.Simulated);
		for ( var C in $) {
			var B = $[C];
			if (typeof B == "function" && !(C in _))
				_[C] = A.findOrStore(B)
		}
	}
	_._extended = true;
	return _
};
Element.extend.cache = {
	findOrStore : function($) {
		return this[$] = this[$] || function() {
			return $.apply(null, [ this ].concat($A(arguments)))
		}
	}
};
Element.Methods = {
	visible : function($) {
		return $prototype($).style.display != "none"
	},
	toggle : function($) {
		$ = $prototype($);
		Element[Element.visible($) ? "hide" : "show"]($);
		return $
	},
	hide : function($) {
		$prototype($).style.display = "none";
		return $
	},
	show : function($) {
		$prototype($).style.display = "";
		return $
	},
	remove : function($) {
		$ = $prototype($);
		$.parentNode.removeChild($);
		return $
	},
	update : function($, _) {
		_ = typeof _ == "undefined" ? "" : _.toString();
		$prototype($).innerHTML = _.stripScripts();
		setTimeout(function() {
			_.evalScripts()
		}, 10);
		return $
	},
	replace : function($, A) {
		$ = $prototype($);
		A = typeof A == "undefined" ? "" : A.toString();
		if ($.outerHTML)
			$.outerHTML = A.stripScripts();
		else {
			var _ = $.ownerDocument.createRange();
			_.selectNodeContents($);
			$.parentNode.replaceChild(_.createContextualFragment(A
					.stripScripts()), $)
		}
		setTimeout(function() {
			A.evalScripts()
		}, 10);
		return $
	},
	recursivelyCollect : function($, _) {
		$ = $prototype($);
		var A = [];
		while ($ = $[_])
			if ($.nodeType == 1)
				A.push(Element.extend($));
		return A
	},
	ancestors : function($) {
		return $prototype($).recursivelyCollect("parentNode")
	},
	descendants : function($) {
		return $A($prototype($).getElementsByTagName("*"))
	},
	immediateDescendants : function($) {
		if (!($ = $prototype($).firstChild))
			return [];
		while ($ && $.nodeType != 1)
			$ = $.nextSibling;
		if ($)
			return [ $ ].concat($prototype($).nextSiblings());
		return []
	},
	previousSiblings : function($) {
		return $prototype($).recursivelyCollect("previousSibling")
	},
	nextSiblings : function($) {
		return $prototype($).recursivelyCollect("nextSibling")
	},
	siblings : function($) {
		$ = $prototype($);
		return $.previousSiblings().reverse().concat($.nextSiblings())
	},
	getElementsByClassName : function($, _) {
		return document.getElementsByClassName(_, $)
	},
	readAttribute : function($, A) {
		$ = $prototype($);
		if (document.all && !window.opera) {
			var _ = Element._attributeTranslations;
			if (_.values[A])
				return _.values[A]($, A);
			if (_.names[A])
				A = _.names[A];
			var B = $.attributes[A];
			if (B)
				return B.nodeValue
		}
		return $.getAttribute(A)
	},
	getHeight : function($) {
		return $prototype($).getDimensions().height
	},
	getWidth : function($) {
		return $prototype($).getDimensions().width
	},
	classNames : function($) {
		return new Element.ClassNames($)
	},
	hasClassName : function(_, A) {
		if (!(_ = $prototype(_)))
			return;
		var $ = _.className;
		if ($.length == 0)
			return false;
		if ($ == A || $.match(new RegExp("(^|\\s)" + A + "(\\s|$)")))
			return true;
		return false
	},
	addClassName : function($, _) {
		if (!($ = $prototype($)))
			return;
		Element.classNames($).add(_);
		return $
	},
	removeClassName : function($, _) {
		if (!($ = $prototype($)))
			return;
		Element.classNames($).remove(_);
		return $
	},
	toggleClassName : function($, _) {
		if (!($ = $prototype($)))
			return;
		Element.classNames($)[$.hasClassName(_) ? "remove" : "add"](_);
		return $
	},
	observe : function() {
		Event.observe.apply(Event, arguments);
		return $A(arguments).first()
	},
	stopObserving : function() {
		Event.stopObserving.apply(Event, arguments);
		return $A(arguments).first()
	},
	empty : function($) {
		return $prototype($).innerHTML.match(/^\s*$/)
	},
	descendantOf : function($, _) {
		$ = $prototype($), _ = $prototype(_);
		while ($ = $.parentNode)
			if ($ == _)
				return true;
		return false
	},
	getStyle : function($, _) {
		$ = $prototype($);
		if ( [ "float", "cssFloat" ].include(_))
			_ = (typeof $.style.styleFloat != "undefined" ? "styleFloat"
					: "cssFloat");
		_ = _.camelize();
		var A = $.style[_];
		if (!A)
			if (document.defaultView && document.defaultView.getComputedStyle) {
				var B = document.defaultView.getComputedStyle($, null);
				A = B ? B[_] : null
			} else if ($.currentStyle)
				A = $.currentStyle[_];
		if ((A == "auto") && [ "width", "height" ].include(_)
				&& ($.getStyle("display") != "none"))
			A = $["offset" + _.capitalize()] + "px";
		if (window.opera && [ "left", "top", "right", "bottom" ].include(_))
			if (Element.getStyle($, "position") == "static")
				A = "auto";
		if (_ == "opacity") {
			if (A)
				return parseFloat(A);
			if (A = ($.getStyle("filter") || "").match(/alpha\(opacity=(.*)\)/))
				if (A[1])
					return parseFloat(A[1]) / 100;
			return 1
		}
		return A == "auto" ? null : A
	},
	setStyle : function($, _) {
		$ = $prototype($);
		for ( var A in _) {
			var B = _[A];
			if (A == "opacity") {
				if (B == 1) {
					B = (/Gecko/.test(navigator.userAgent) && !/Konqueror|Safari|KHTML/
							.test(navigator.userAgent)) ? 0.999999 : 1;
					if (/MSIE/.test(navigator.userAgent) && !window.opera)
						$.style.filter = $.getStyle("filter").replace(
								/alpha\([^\)]*\)/gi, "")
				} else if (B == "") {
					if (/MSIE/.test(navigator.userAgent) && !window.opera)
						$.style.filter = $.getStyle("filter").replace(
								/alpha\([^\)]*\)/gi, "")
				} else {
					if (B < 0.00001)
						B = 0;
					if (/MSIE/.test(navigator.userAgent) && !window.opera)
						$.style.filter = $.getStyle("filter").replace(
								/alpha\([^\)]*\)/gi, "")
								+ "alpha(opacity=" + B * 100 + ")"
				}
			} else if ( [ "float", "cssFloat" ].include(A))
				A = (typeof $.style.styleFloat != "undefined") ? "styleFloat"
						: "cssFloat";
			$.style[A.camelize()] = B
		}
		return $
	},
	getDimensions : function($) {
		$ = $prototype($);
		var C = $prototype($).getStyle("display");
		if (C != "none" && C != null)
			return {
				width : $.offsetWidth,
				height : $.offsetHeight
			};
		var E = $.style, F = E.visibility, _ = E.position, B = E.display;
		E.visibility = "hidden";
		E.position = "absolute";
		E.display = "block";
		var D = $.clientWidth, A = $.clientHeight;
		E.display = B;
		E.position = _;
		E.visibility = F;
		return {
			width : D,
			height : A
		}
	}
};
Object.extend(Element.Methods, {
	childOf : Element.Methods.descendantOf
});
Element._attributeTranslations = {};
Element._attributeTranslations.names = {
	colspan : "colSpan",
	rowspan : "rowSpan",
	valign : "vAlign",
	datetime : "dateTime",
	accesskey : "accessKey",
	tabindex : "tabIndex",
	enctype : "encType",
	maxlength : "maxLength",
	readonly : "readOnly",
	longdesc : "longDesc"
};
Element._attributeTranslations.values = {
	_getAttr : function($, _) {
		return $.getAttribute(_, 2)
	},
	_flag : function($, _) {
		return $prototype($).hasAttribute(_) ? _ : null
	},
	style : function($) {
		return $.style.cssText.toLowerCase()
	},
	title : function($) {
		var _ = $.getAttributeNode("title");
		return _.specified ? _.nodeValue : null
	}
};
Object.extend(Element._attributeTranslations.values, {
	href : Element._attributeTranslations.values._getAttr,
	src : Element._attributeTranslations.values._getAttr,
	disabled : Element._attributeTranslations.values._flag,
	checked : Element._attributeTranslations.values._flag,
	readonly : Element._attributeTranslations.values._flag,
	multiple : Element._attributeTranslations.values._flag
});
Element.Methods.Simulated = {
	hasAttribute : function($, A) {
		var _ = Element._attributeTranslations;
		A = _.names[A] || A;
		return $prototype($).getAttributeNode(A).specified
	}
};
Object.extend(Element, Element.Methods);
var _nativeExtensions = false;
if (/Konqueror|Safari|KHTML/.test(navigator.userAgent))
	[ "", "Form", "Input", "TextArea", "Select" ]
			.each(function(_) {
				var A = "HTML" + _ + "Element";
				if (window[A])
					return;
				var $ = window[A] = {};
				$.prototype = document.createElement(_ ? _.toLowerCase()
						: "div").__proto__
			});
Element.addMethods = function($) {
	Object.extend(Element.Methods, $ || {});
	function _($, D, C) {
		C = C || false;
		var _ = Element.extend.cache;
		for ( var B in $) {
			var A = $[B];
			if (!C || !(B in D))
				D[B] = _.findOrStore(A)
		}
	}
	if (typeof HTMLElement != "undefined") {
		_(Element.Methods, HTMLElement.prototype);
		_(Element.Methods.Simulated, HTMLElement.prototype, true);
		_(Form.Methods, HTMLFormElement.prototype);
		[ HTMLInputElement, HTMLTextAreaElement, HTMLSelectElement ]
				.each(function($) {
					_(Form.Element.Methods, $.prototype)
				});
		_nativeExtensions = true
	}
};
Abstract.Insertion = function($) {
	this.adjacency = $
};
Abstract.Insertion.prototype = {
	initialize : function(_, $) {
		this.element = $prototype(_);
		this.content = $.stripScripts();
		if (this.adjacency && this.element.insertAdjacentHTML) {
			try {
				this.element.insertAdjacentHTML(this.adjacency, this.content)
			} catch (A) {
				var B = this.element.tagName.toUpperCase();
				if ( [ "TBODY", "TR" ].include(B))
					this.insertContent(this.contentFromAnonymousTable());
				else
					throw A
			}
		} else {
			this.range = this.element.ownerDocument.createRange();
			if (this.initializeRange)
				this.initializeRange();
			this.insertContent( [ this.range
					.createContextualFragment(this.content) ])
		}
		setTimeout(function() {
			$.evalScripts()
		}, 10)
	},
	contentFromAnonymousTable : function() {
		var $ = document.createElement("div");
		$.innerHTML = "<table><tbody>" + this.content + "</tbody></table>";
		return $A($.childNodes[0].childNodes[0].childNodes)
	}
};
var Insertion = new Object();
Insertion.Before = Class.create();
Insertion.Before.prototype = Object.extend(
		new Abstract.Insertion("beforeBegin"), {
			initializeRange : function() {
				this.range.setStartBefore(this.element)
			},
			insertContent : function($) {
				$.each((function($) {
					this.element.parentNode.insertBefore($, this.element)
				}).bind(this))
			}
		});
Insertion.Top = Class.create();
Insertion.Top.prototype = Object.extend(new Abstract.Insertion("afterBegin"), {
	initializeRange : function() {
		this.range.selectNodeContents(this.element);
		this.range.collapse(true)
	},
	insertContent : function($) {
		$.reverse(false).each((function($) {
			this.element.insertBefore($, this.element.firstChild)
		}).bind(this))
	}
});
Insertion.Bottom = Class.create();
Insertion.Bottom.prototype = Object.extend(new Abstract.Insertion("beforeEnd"),
		{
			initializeRange : function() {
				this.range.selectNodeContents(this.element);
				this.range.collapse(this.element)
			},
			insertContent : function($) {
				$.each((function($) {
					this.element.appendChild($)
				}).bind(this))
			}
		});
Insertion.After = Class.create();
Insertion.After.prototype = Object.extend(new Abstract.Insertion("afterEnd"), {
	initializeRange : function() {
		this.range.setStartAfter(this.element)
	},
	insertContent : function($) {
		$.each((function($) {
			this.element.parentNode.insertBefore($, this.element.nextSibling)
		}).bind(this))
	}
});
Element.ClassNames = Class.create();
Element.ClassNames.prototype = {
	initialize : function($) {
		this.element = $prototype($)
	},
	_each : function($) {
		this.element.className.split(/\s+/).select(function($) {
			return $.length > 0
		})._each($)
	},
	set : function($) {
		this.element.className = $
	},
	add : function($) {
		if (this.include($))
			return;
		this.set($A(this).concat($).join(" "))
	},
	remove : function($) {
		if (!this.include($))
			return;
		this.set($A(this).without($).join(" "))
	},
	toString : function() {
		return $A(this).join(" ")
	}
};
Object.extend(Element.ClassNames.prototype, Enumerable);
var Form = {
	reset : function($) {
		$prototype($).reset();
		return $
	},
	serializeElements : function(A, $) {
		var _ = A.inject( {}, function(_, $) {
			if (!$.disabled && $.name) {
				var B = $.name, A = $prototype($).getValue();
				if (A != undefined)
					if (_[B]) {
						if (_[B].constructor != Array)
							_[B] = [ _[B] ];
						_[B].push(A)
					} else
						_[B] = A
			}
			return _
		});
		return $ ? _ : Hash.toQueryString(_)
	}
};
Form.Methods = {
	serialize : function(_, $) {
		return Form.serializeElements(Form.getElements(_), $)
	},
	getElements : function($) {
		return $A($prototype($).getElementsByTagName("*")).inject( [],
				function(_, $) {
					if (Form.Element.Serializers[$.tagName.toLowerCase()])
						_.push(Element.extend($));
					return _
				})
	},
	getInputs : function(C, $, D) {
		C = $prototype(C);
		var B = C.getElementsByTagName("input");
		if (!$ && !D)
			return $A(B).map(Element.extend);
		for ( var F = 0, A = [], E = B.length; F < E; F++) {
			var _ = B[F];
			if (($ && _.type != $) || (D && _.name != D))
				continue;
			A.push(Element.extend(_))
		}
		return A
	}
};
Object.extend(Form, Form.Methods);
Form.Element = {
	focus : function($) {
		$prototype($).focus();
		return $
	},
	select : function($) {
		$prototype($).select();
		return $
	}
};
Form.Element.Methods = {
	serialize : function($) {
		$ = $prototype($);
		if (!$.disabled && $.name) {
			var A = $.getValue();
			if (A != undefined) {
				var _ = {};
				_[$.name] = A;
				return Hash.toQueryString(_)
			}
		}
		return ""
	},
	getValue : function($) {
		$ = $prototype($);
		var _ = $.tagName.toLowerCase();
		return Form.Element.Serializers[_]($)
	}
};
Object.extend(Form.Element, Form.Element.Methods);
var Field = Form.Element, $F = Form.Element.getValue;
Form.Element.Serializers = {
	input : function($) {
		switch ($.type.toLowerCase()) {
		case "checkbox":
		case "radio":
			return Form.Element.Serializers.inputSelector($);
		default:
			return Form.Element.Serializers.textarea($)
		}
	},
	inputSelector : function($) {
		return $.checked ? $.value : null
	},
	textarea : function($) {
		return $.value
	},
	select : function($) {
		return this[$.type == "select-one" ? "selectOne" : "selectMany"]($)
	},
	selectOne : function($) {
		var _ = $.selectedIndex;
		return _ >= 0 ? this.optionValue($.options[_]) : null
	},
	selectMany : function($) {
		var _, A = $.length;
		if (!A)
			return null;
		for ( var C = 0, _ = []; C < A; C++) {
			var B = $.options[C];
			if (B.selected)
				_.push(this.optionValue(B))
		}
		return _
	},
	optionValue : function($) {
		return Element.extend($).hasAttribute("value") ? $.value : $.text
	}
};
if (!window.Event)
	var Event = new Object();
Object
		.extend(
				Event,
				{
					pointerX : function($) {
						return $.pageX
								|| ($.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft))
					},
					pointerY : function($) {
						return $.pageY
								|| ($.clientY + (document.documentElement.scrollTop || document.body.scrollTop))
					},
					element : function($) {
						return $.target || $.srcElement
					},
					stop : function($) {
						if ($.preventDefault) {
							$.preventDefault();
							$.stopPropagation()
						} else {
							$.returnValue = false;
							$.cancelBubble = true
						}
					},
					observers : false,
					_observeAndCache : function(_, A, B, $) {
						if (!this.observers)
							this.observers = [];
						if (_.addEventListener) {
							this.observers.push( [ _, A, B, $ ]);
							_.addEventListener(A, B, $)
						} else if (_.attachEvent) {
							this.observers.push( [ _, A, B, $ ]);
							_.attachEvent("on" + A, B)
						}
					},
					unloadCache : function() {
						if (!Event.observers)
							return;
						for ( var _ = 0, $ = Event.observers.length; _ < $; _++) {
							Event.stopObserving.apply(this, Event.observers[_]);
							Event.observers[_][0] = null
						}
						Event.observers = false
					},
					observe : function(_, A, B, $) {
						_ = $prototype(_);
						$ = $ || false;
						if (A == "keypress"
								&& (navigator.appVersion
										.match(/Konqueror|Safari|KHTML/) || _.attachEvent))
							A = "keydown";
						Event._observeAndCache(_, A, B, $)
					},
					stopObserving : function(_, B, C, $) {
						_ = $prototype(_);
						$ = $ || false;
						if (B == "keypress"
								&& (navigator.appVersion
										.match(/Konqueror|Safari|KHTML/) || _.detachEvent))
							B = "keydown";
						if (_.removeEventListener)
							_.removeEventListener(B, C, $);
						else if (_.detachEvent) {
							try {
								_.detachEvent("on" + B, C)
							} catch (A) {
							}
						}
					}
				});
if (navigator.appVersion.match(/\bMSIE\b/))
	Event.observe(window, "unload", Event.unloadCache, false);
Element.addMethods()