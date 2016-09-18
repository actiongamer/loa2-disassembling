package com.junkbyte.console.core
{
   import flash.utils.getQualifiedClassName;
   import com.junkbyte.console.vos.WeakObject;
   import flash.utils.Dictionary;
   import flash.utils.ByteArray;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.geom.Matrix;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import com.junkbyte.console.Console;
   
   public class LogReferences extends ConsoleCore
   {
      
      public static const INSPECTING_CHANNEL:String = "⌂";
       
      
      private var _refMap:WeakObject;
      
      private var _refRev:Dictionary;
      
      private var _refIndex:uint = 1;
      
      private var _dofull:Boolean;
      
      private var _current;
      
      private var _history:Array;
      
      private var _hisIndex:uint;
      
      public function LogReferences(param1:Console)
      {
         super(param1);
         this._refMap = new WeakObject();
         this._refRev = new Dictionary(true);
         remoter.registerClient("ref",this.handleString);
         remoter.registerClient("focus",this.handleFocused);
      }
      
      public static function EscHTML(param1:String) : String
      {
         param1 = param1.replace(/</gm,"&lt;");
         return param1.replace(/>/gm,"&gt;");
      }
      
      public static function ShortClassName(param1:Object, param2:Boolean = true) : String
      {
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:int = _loc3_.indexOf("::");
         var _loc5_:String = param1 is Class?"*":"";
         _loc3_ = _loc5_ + _loc3_.substring(_loc4_ >= 0?Number(_loc4_ + 2):0) + _loc5_;
         if(param2)
         {
            return EscHTML(_loc3_);
         }
         return _loc3_;
      }
      
      public function setLogRef(param1:*) : uint
      {
         var _loc3_:int = 0;
         if(!config.useObjectLinking)
         {
            return 0;
         }
         var _loc2_:uint = this._refRev[param1];
         if(!_loc2_)
         {
            _loc2_ = this._refIndex;
            this._refMap[_loc2_] = param1;
            this._refRev[param1] = _loc2_;
            this._refIndex++;
            _loc3_ = _loc2_ - 50;
            while(_loc3_ >= 0)
            {
               if(this._refMap[_loc3_] === null)
               {
                  delete this._refMap[_loc3_];
               }
               _loc3_ = _loc3_ - 50;
            }
         }
         return _loc2_;
      }
      
      public function getRefId(param1:*) : uint
      {
         return this._refRev[param1];
      }
      
      public function getRefById(param1:uint) : *
      {
         return this._refMap[param1];
      }
      
      public function makeString(param1:*, param2:String = null, param3:Boolean = false, param4:int = -1) : String
      {
         var txt:String = null;
         var v:* = undefined;
         var err:Error = null;
         var stackstr:String = null;
         var str:String = null;
         var len:int = 0;
         var hasmaxlen:Boolean = false;
         var i:int = 0;
         var strpart:String = null;
         var add:String = null;
         var o:* = param1;
         var prop:String = param2;
         var html:Boolean = param3;
         var maxlen:int = param4;
         try
         {
            v = !!prop?o[prop]:o;
         }
         catch(err:Error)
         {
            return "<p0><i>" + err.toString() + "</i></p0>";
         }
         if(v is Error)
         {
            err = v as Error;
            stackstr = !!err.hasOwnProperty("getStackTrace")?err.getStackTrace():err.toString();
            if(stackstr)
            {
               return stackstr;
            }
            return err.toString();
         }
         if(v is XML || v is XMLList)
         {
            return this.shortenString(EscHTML(v.toXMLString()),maxlen,o,prop);
         }
         if(v is Array || getQualifiedClassName(v).indexOf("__AS3__.vec::Vector.") == 0)
         {
            str = "[";
            len = v.length;
            hasmaxlen = maxlen >= 0;
            i = 0;
            while(i < len)
            {
               strpart = this.makeString(v[i],null,false,maxlen);
               str = str + ((!!i?", ":"") + strpart);
               maxlen = maxlen - strpart.length;
               if(hasmaxlen && maxlen <= 0 && i < len - 1)
               {
                  str = str + (", " + this.genLinkString(o,prop,"..."));
                  break;
               }
               i++;
            }
            return str + "]";
         }
         if(config.useObjectLinking && v && typeof v == "object")
         {
            add = "";
            if(v is ByteArray)
            {
               add = " position:" + v.position + " length:" + v.length;
            }
            else if(v is Date || v is Rectangle || v is Point || v is Matrix || v is Event)
            {
               add = " " + String(v);
            }
            else if(v is DisplayObject && v.name)
            {
               add = " " + v.name;
            }
            txt = "{" + this.genLinkString(o,prop,ShortClassName(v)) + EscHTML(add) + "}";
         }
         else
         {
            if(v is ByteArray)
            {
               txt = "[ByteArray position:" + ByteArray(v).position + " length:" + ByteArray(v).length + "]";
            }
            else
            {
               txt = String(v);
            }
            if(!html)
            {
               return this.shortenString(EscHTML(txt),maxlen,o,prop);
            }
         }
         return txt;
      }
      
      public function makeRefTyped(param1:*) : String
      {
         if(param1 && typeof param1 == "object")
         {
            return "{" + this.genLinkString(param1,null,ShortClassName(param1)) + "}";
         }
         return ShortClassName(param1);
      }
      
      private function genLinkString(param1:*, param2:String, param3:String) : String
      {
         var _loc4_:uint = this.setLogRef(param1);
         if(_loc4_)
         {
            return "<l><a href=\'event:ref_" + _loc4_ + (!!param2?"_" + param2:"") + "\'>" + param3 + "</a></l>";
         }
         return param3;
      }
      
      private function shortenString(param1:String, param2:int, param3:*, param4:String = null) : String
      {
         if(param2 >= 0 && param1.length > param2)
         {
            param1 = param1.substring(0,param2);
            return param1 + this.genLinkString(param3,param4," ...");
         }
         return param1;
      }
      
      private function historyInc(param1:int) : void
      {
         this._hisIndex = this._hisIndex + param1;
         var _loc2_:* = this._history[this._hisIndex];
         if(_loc2_)
         {
            this.focus(_loc2_,this._dofull);
         }
      }
      
      public function handleRefEvent(param1:String) : void
      {
         if(remoter.remoting == Remoting.RECIEVER)
         {
            remoter.send("ref",param1);
         }
         else
         {
            this.handleString(param1);
         }
      }
      
      private function handleString(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         if(param1 == "refexit")
         {
            this.exitFocus();
            console.setViewingChannels();
         }
         else if(param1 == "refprev")
         {
            this.historyInc(-2);
         }
         else if(param1 == "reffwd")
         {
            this.historyInc(0);
         }
         else if(param1 == "refi")
         {
            this.focus(this._current,!this._dofull);
         }
         else
         {
            _loc2_ = param1.indexOf("_") + 1;
            if(_loc2_ > 0)
            {
               _loc4_ = "";
               _loc5_ = param1.indexOf("_",_loc2_);
               if(_loc5_ > 0)
               {
                  _loc3_ = uint(param1.substring(_loc2_,_loc5_));
                  _loc4_ = param1.substring(_loc5_ + 1);
               }
               else
               {
                  _loc3_ = uint(param1.substring(_loc2_));
               }
               _loc6_ = this.getRefById(_loc3_);
               if(_loc4_)
               {
                  _loc6_ = _loc6_[_loc4_];
               }
               if(_loc6_)
               {
                  if(param1.indexOf("refe_") == 0)
                  {
                     console.explode(_loc6_);
                  }
                  else
                  {
                     this.focus(_loc6_,this._dofull);
                  }
                  return;
               }
            }
            report("Reference no longer exist (garbage collected).",-2);
         }
      }
      
      public function focus(param1:*, param2:Boolean = false) : void
      {
         remoter.send("focus");
         console.clear(LogReferences.INSPECTING_CHANNEL);
         console.setViewingChannels(LogReferences.INSPECTING_CHANNEL);
         if(!this._history)
         {
            this._history = new Array();
         }
         if(this._current != param1)
         {
            this._current = param1;
            if(this._history.length <= this._hisIndex)
            {
               this._history.push(param1);
            }
            else
            {
               this._history[this._hisIndex] = param1;
            }
            this._hisIndex++;
         }
         this._dofull = param2;
         this.inspect(param1,this._dofull);
      }
      
      private function handleFocused() : void
      {
         console.clear(LogReferences.INSPECTING_CHANNEL);
         console.setViewingChannels(LogReferences.INSPECTING_CHANNEL);
      }
      
      public function exitFocus() : void
      {
         this._current = null;
         this._dofull = false;
         this._history = null;
         this._hisIndex = 0;
         if(remoter.remoting == Remoting.SENDER)
         {
            remoter.send("ref","refexit");
         }
         console.clear(LogReferences.INSPECTING_CHANNEL);
      }
      
      public function inspect(param1:*, param2:Boolean = true) : void
      {
         var menuStr:String = null;
         var nodes:XMLList = null;
         var constantX:XML = null;
         var hasstuff:Boolean = false;
         var isstatic:Boolean = false;
         var methodX:XML = null;
         var accessorX:XML = null;
         var variableX:XML = null;
         var extendX:XML = null;
         var implementX:XML = null;
         var metadataX:XML = null;
         var mn:XMLList = null;
         var en:String = null;
         var et:String = null;
         var disp:DisplayObject = null;
         var theParent:DisplayObjectContainer = null;
         var pr:DisplayObjectContainer = null;
         var indstr:String = null;
         var cont:DisplayObjectContainer = null;
         var clen:int = 0;
         var ci:int = 0;
         var child:DisplayObject = null;
         var params:Array = null;
         var mparamsList:XMLList = null;
         var paraX:XML = null;
         var access:String = null;
         var X:String = null;
         var obj:* = param1;
         var viewAll:Boolean = param2;
         if(!obj)
         {
            report(obj,-2,true);
            return;
         }
         var refIndex:uint = this.setLogRef(obj);
         var showInherit:String = "";
         if(!viewAll)
         {
            showInherit = " [<a href=\'event:refi\'>Show inherited</a>]";
         }
         if(this._history)
         {
            menuStr = "<b>[<a href=\'event:refexit\'>Exit</a>]";
            if(this._hisIndex > 1)
            {
               menuStr = menuStr + " [<a href=\'event:refprev\'>Previous</a>]";
            }
            if(this._history && this._hisIndex < this._history.length)
            {
               menuStr = menuStr + " [<a href=\'event:reffwd\'>Forward</a>]";
            }
            menuStr = menuStr + ("</b> || [<a href=\'event:ref_" + refIndex + "\'>refresh</a>]");
            menuStr = menuStr + ("</b> [<a href=\'event:refe_" + refIndex + "\'>explode</a>]");
            if(config.commandLineAllowed)
            {
               menuStr = menuStr + (" [<a href=\'event:cl_" + refIndex + "\'>Set scope</a>]");
            }
            if(viewAll)
            {
               menuStr = menuStr + " [<a href=\'event:refi\'>Hide inherited</a>]";
            }
            else
            {
               menuStr = menuStr + showInherit;
            }
            report(menuStr,-1,true);
            report();
         }
         var V:XML = describeType(obj);
         var cls:Object = obj is Class?obj:obj.constructor;
         var clsV:XML = describeType(cls);
         var self:String = V.@name;
         var isClass:Boolean = obj is Class;
         var st:String = !!isClass?"*":"";
         var str:String = "<b>{" + st + this.genLinkString(obj,null,EscHTML(self)) + st + "}</b>";
         var props:Array = [];
         if(V.@isStatic == "true")
         {
            props.push("<b>static</b>");
         }
         if(V.@isDynamic == "true")
         {
            props.push("dynamic");
         }
         if(V.@isFinal == "true")
         {
            props.push("final");
         }
         if(props.length > 0)
         {
            str = str + (" <p-1>" + props.join(" | ") + "</p-1>");
         }
         report(str,-2,true);
         nodes = V.extendsClass;
         if(nodes.length())
         {
            props = [];
            for each(extendX in nodes)
            {
               st = extendX.@type.toString();
               props.push(st.indexOf("*") < 0?this.makeValue(getDefinitionByName(st)):EscHTML(st));
               if(viewAll)
               {
                  continue;
               }
               break;
            }
            report("<p10>Extends:</p10> " + props.join(" &gt; "));
         }
         nodes = V.implementsInterface;
         if(nodes.length())
         {
            props = [];
            for each(implementX in nodes)
            {
               props.push(this.makeValue(getDefinitionByName(implementX.@type.toString())));
            }
            report("<p10>Implements:</p10> " + props.join(", "));
         }
         report();
         props = [];
         nodes = V.metadata.(@name == "Event");
         if(nodes.length())
         {
            for each(metadataX in nodes)
            {
               mn = metadataX.arg;
               en = mn.(@key == "name").@value;
               et = mn.(@key == "type").@value;
               if(refIndex)
               {
                  props.push("<a href=\'event:cl_" + refIndex + "_dispatchEvent(new " + et + "(\"" + en + "\"))\'>" + en + "</a><p0>(" + et + ")</p0>");
               }
               else
               {
                  props.push(en + "<p0>(" + et + ")</p0>");
               }
            }
            report("<p10>Events:</p10> " + props.join("<p-1>; </p-1>"));
            report();
         }
         if(obj is DisplayObject)
         {
            disp = obj as DisplayObject;
            theParent = disp.parent;
            if(theParent)
            {
               props = new Array("@" + theParent.getChildIndex(disp));
               while(theParent)
               {
                  pr = theParent;
                  theParent = theParent.parent;
                  indstr = !!theParent?"@" + theParent.getChildIndex(pr):"";
                  props.push("<b>" + pr.name + "</b>" + indstr + this.makeValue(pr));
               }
               report("<p10>Parents:</p10> " + props.join("<p-1> -> </p-1>") + "<br/>",1,true);
            }
         }
         if(obj is DisplayObjectContainer)
         {
            props = [];
            cont = obj as DisplayObjectContainer;
            clen = cont.numChildren;
            ci = 0;
            while(ci < clen)
            {
               child = cont.getChildAt(ci);
               props.push("<b>" + child.name + "</b>@" + ci + this.makeValue(child));
               ci++;
            }
            if(clen)
            {
               report("<p10>Children:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",1,true);
            }
         }
         props = [];
         nodes = clsV..constant;
         for each(constantX in nodes)
         {
            report(" const <p3>" + constantX.@name + "</p3>:" + constantX.@type + " = " + this.makeValue(cls,constantX.@name) + "</p0>",1);
         }
         if(nodes.length())
         {
            report("");
         }
         var inherit:uint = 0;
         props = [];
         nodes = clsV..method;
         for each(methodX in nodes)
         {
            if(viewAll || self == methodX.@declaredBy)
            {
               hasstuff = true;
               isstatic = methodX.parent().name() != "factory";
               str = " " + (!!isstatic?"static ":"") + "function ";
               params = [];
               mparamsList = methodX.parameter;
               for each(paraX in mparamsList)
               {
                  params.push(paraX.@optional == "true"?"<i>" + paraX.@type + "</i>":paraX.@type);
               }
               if(refIndex && (isstatic || !isClass))
               {
                  str = str + ("<a href=\'event:cl_" + refIndex + "_" + methodX.@name + "()\'><p3>" + methodX.@name + "</p3></a>");
               }
               else
               {
                  str = str + ("<p3>" + methodX.@name + "</p3>");
               }
               str = str + ("(" + params.join(", ") + "):" + methodX.@returnType);
               report(str,1);
            }
            else
            {
               inherit++;
            }
         }
         if(inherit)
         {
            report("   \t + " + inherit + " inherited methods." + showInherit,1);
         }
         else if(hasstuff)
         {
            report();
         }
         hasstuff = false;
         inherit = 0;
         props = [];
         nodes = clsV..accessor;
         for each(accessorX in nodes)
         {
            if(viewAll || self == accessorX.@declaredBy)
            {
               hasstuff = true;
               isstatic = accessorX.parent().name() != "factory";
               str = " ";
               if(isstatic)
               {
                  str = str + "static ";
               }
               access = accessorX.@access;
               if(access == "readonly")
               {
                  str = str + "get";
               }
               else if(access == "writeonly")
               {
                  str = str + "set";
               }
               else
               {
                  str = str + "assign";
               }
               if(refIndex && (isstatic || !isClass))
               {
                  str = str + (" <a href=\'event:cl_" + refIndex + "_" + accessorX.@name + "\'><p3>" + accessorX.@name + "</p3></a>:" + accessorX.@type);
               }
               else
               {
                  str = str + (" <p3>" + accessorX.@name + "</p3>:" + accessorX.@type);
               }
               if(access != "writeonly" && (isstatic || !isClass))
               {
                  str = str + (" = " + this.makeValue(!!isstatic?cls:obj,accessorX.@name));
               }
               report(str,1);
            }
            else
            {
               inherit++;
            }
         }
         if(inherit)
         {
            report("   \t + " + inherit + " inherited accessors." + showInherit,1);
         }
         else if(hasstuff)
         {
            report();
         }
         nodes = clsV..variable;
         for each(variableX in nodes)
         {
            isstatic = variableX.parent().name() != "factory";
            str = !!isstatic?" static":"";
            if(refIndex)
            {
               str = str + (" var <p3><a href=\'event:cl_" + refIndex + "_" + variableX.@name + " = \'>" + variableX.@name + "</a>");
            }
            else
            {
               str = str + (" var <p3>" + variableX.@name);
            }
            str = str + ("</p3>:" + variableX.@type + " = " + this.makeValue(!!isstatic?cls:obj,variableX.@name));
            report(str,1);
         }
         try
         {
            props = [];
            for(X in obj)
            {
               if(refIndex)
               {
                  str = "<a href=\'event:cl_" + refIndex + "_" + X + " = \'>" + X + "</a>";
               }
               else
               {
                  str = X;
               }
               report(" dynamic var <p3>" + str + "</p3> = " + this.makeValue(obj,X),1);
            }
         }
         catch(e:Error)
         {
            report("Could not get values due to: " + e,9);
         }
         if(obj is String)
         {
            report();
            report("String",10);
            report(EscHTML(obj));
         }
         else if(obj is XML || obj is XMLList)
         {
            report();
            report("XMLString",10);
            report(EscHTML(obj.toXMLString()));
         }
         if(menuStr)
         {
            report();
            report(menuStr,-1,true);
         }
      }
      
      public function getPossibleCalls(param1:*) : Array
      {
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc2_:Array = new Array();
         var _loc3_:XML = describeType(param1);
         var _loc4_:XMLList = _loc3_.method;
         for each(_loc5_ in _loc4_)
         {
            _loc2_.push(_loc5_.@name + "(");
         }
         _loc4_ = _loc3_.accessor;
         for each(_loc6_ in _loc4_)
         {
            _loc2_.push(_loc6_.@name);
         }
         _loc4_ = _loc3_.variable;
         for each(_loc7_ in _loc4_)
         {
            _loc2_.push(_loc7_.@name);
         }
         return _loc2_;
      }
      
      private function makeValue(param1:*, param2:String = null) : String
      {
         return this.makeString(param1,param2,false,!!config.useObjectLinking?100:-1);
      }
      
      public function explode(param1:Object, param2:int = 3, param3:int = 9) : String
      {
         var nodes:XMLList = null;
         var n:String = null;
         var accessorX:XML = null;
         var variableX:XML = null;
         var X:String = null;
         var obj:Object = param1;
         var depth:int = param2;
         var p:int = param3;
         var t:String = typeof obj;
         if(obj == null)
         {
            return "<p-2>" + obj + "</p-2>";
         }
         if(obj is String)
         {
            return "\"" + EscHTML(obj as String) + "\"";
         }
         if(t != "object" || depth == 0 || obj is ByteArray)
         {
            return this.makeString(obj);
         }
         if(p < 0)
         {
            p = 0;
         }
         var V:XML = describeType(obj);
         var list:Array = [];
         nodes = V["accessor"];
         for each(accessorX in nodes)
         {
            n = accessorX.@name;
            if(accessorX.@access != "writeonly")
            {
               try
               {
                  list.push(this.stepExp(obj,n,depth,p));
               }
               catch(e:Error)
               {
               }
            }
            else
            {
               list.push(n);
            }
         }
         nodes = V["variable"];
         for each(variableX in nodes)
         {
            n = variableX.@name;
            list.push(this.stepExp(obj,n,depth,p));
         }
         try
         {
            for(X in obj)
            {
               list.push(this.stepExp(obj,X,depth,p));
            }
         }
         catch(e:Error)
         {
         }
         return "<p" + p + ">{" + ShortClassName(obj) + "</p" + p + "> " + list.join(", ") + "<p" + p + ">}</p" + p + ">";
      }
      
      private function stepExp(param1:*, param2:String, param3:int, param4:int) : String
      {
         return param2 + ":" + this.explode(param1[param2],param3 - 1,param4 - 1);
      }
   }
}
