package com.junkbyte.console.core
{
   import com.junkbyte.console.vos.GraphGroup;
   import flash.geom.Rectangle;
   import com.junkbyte.console.vos.GraphInterest;
   import flash.utils.getTimer;
   import flash.system.System;
   import com.junkbyte.console.Console;
   
   public class Graphing extends ConsoleCore
   {
       
      
      private var _groups:Array;
      
      private var _map:Object;
      
      private var _fpsGroup:GraphGroup;
      
      private var _memGroup:GraphGroup;
      
      private var _previousTime:Number = -1;
      
      public function Graphing(param1:Console)
      {
         this._groups = [];
         this._map = {};
         super(param1);
         remoter.registerClient("fps",this.fpsRequest);
         remoter.registerClient("mem",this.memRequest);
      }
      
      public function add(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         var newGroup:Boolean = false;
         var i:GraphInterest = null;
         var n:String = param1;
         var obj:Object = param2;
         var prop:String = param3;
         var col:Number = param4;
         var key:String = param5;
         var rect:Rectangle = param6;
         var inverse:Boolean = param7;
         var group:GraphGroup = this._map[n];
         if(!group)
         {
            newGroup = true;
            group = new GraphGroup(n);
         }
         if(isNaN(col) || col < 0)
         {
            col = Math.random() * 16777215;
         }
         if(key == null)
         {
            key = prop;
         }
         var interests:Array = group.interests;
         for each(i in interests)
         {
            if(i.key == key)
            {
               report("Graph with key [" + key + "] already exists in [" + n + "]",10);
               return;
            }
         }
         if(rect)
         {
            group.rect = rect;
         }
         if(inverse)
         {
            group.inv = inverse;
         }
         var interest:GraphInterest = new GraphInterest(key,col);
         var v:Number = NaN;
         try
         {
            v = interest.setObject(obj,prop);
         }
         catch(e:Error)
         {
            report("Error with graph value for [" + key + "] in [" + n + "]. " + e,10);
            return;
         }
         if(isNaN(v))
         {
            report("Graph value for key [" + key + "] in [" + n + "] is not a number (NaN).",10);
         }
         else
         {
            group.interests.push(interest);
            if(newGroup)
            {
               this._map[n] = group;
               this._groups.push(group);
            }
         }
      }
      
      public function fixRange(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         var _loc4_:GraphGroup = null;
         _loc4_ = this._map[param1];
         if(!_loc4_)
         {
            return;
         }
         _loc4_.low = param2;
         _loc4_.hi = param3;
         _loc4_.fixed = !(isNaN(param2) || isNaN(param3));
      }
      
      public function remove(param1:String, param2:Object = null, param3:String = null) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:GraphInterest = null;
         var _loc4_:GraphGroup = this._map[param1];
         if(!_loc4_)
         {
            return;
         }
         if(param2 == null && param3 == null)
         {
            this.removeGroup(param1);
         }
         else
         {
            _loc5_ = _loc4_.interests;
            _loc6_ = _loc5_.length - 1;
            while(_loc6_ >= 0)
            {
               _loc7_ = _loc5_[_loc6_];
               if((param2 == null || _loc7_.obj == param2) && (param3 == null || _loc7_.prop == param3))
               {
                  _loc5_.splice(_loc6_,1);
               }
               _loc6_--;
            }
            if(_loc5_.length == 0)
            {
               this.removeGroup(param1);
            }
         }
      }
      
      private function removeGroup(param1:String) : void
      {
         var _loc2_:GraphGroup = this._map[param1];
         var _loc3_:int = this._groups.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            this._groups.splice(_loc3_,1);
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         if(remoter.remoting == Remoting.RECIEVER)
         {
            return console.panels.fpsMonitor;
         }
         return this._fpsGroup != null;
      }
      
      public function set fpsMonitor(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(remoter.remoting == Remoting.RECIEVER)
         {
            remoter.send("fps",param1);
         }
         else if(param1 != this.fpsMonitor)
         {
            if(param1)
            {
               this._fpsGroup = this.addSpecialGroup(GraphGroup.FPS);
               this._fpsGroup.low = 0;
               this._fpsGroup.fixed = true;
               this._fpsGroup.averaging = 30;
            }
            else
            {
               this._previousTime = -1;
               _loc2_ = this._groups.indexOf(this._fpsGroup);
               if(_loc2_ >= 0)
               {
                  this._groups.splice(_loc2_,1);
               }
               this._fpsGroup = null;
            }
            console.panels.mainPanel.updateMenu();
         }
      }
      
      private function fpsRequest(param1:Boolean) : void
      {
         this.fpsMonitor = param1;
      }
      
      public function get memoryMonitor() : Boolean
      {
         if(remoter.remoting == Remoting.RECIEVER)
         {
            return console.panels.memoryMonitor;
         }
         return this._memGroup != null;
      }
      
      public function set memoryMonitor(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(remoter.remoting == Remoting.RECIEVER)
         {
            remoter.send("mem",param1);
         }
         else if(param1 != this.memoryMonitor)
         {
            if(param1)
            {
               this._memGroup = this.addSpecialGroup(GraphGroup.MEM);
               this._memGroup.freq = 10;
            }
            else
            {
               _loc2_ = this._groups.indexOf(this._memGroup);
               if(_loc2_ >= 0)
               {
                  this._groups.splice(_loc2_,1);
               }
               this._memGroup = null;
            }
            console.panels.mainPanel.updateMenu();
         }
      }
      
      private function memRequest(param1:Boolean) : void
      {
         this.memoryMonitor = param1;
      }
      
      private function addSpecialGroup(param1:int) : GraphGroup
      {
         var _loc2_:GraphGroup = new GraphGroup("special");
         _loc2_.type = param1;
         this._groups.push(_loc2_);
         var _loc3_:GraphInterest = new GraphInterest("special");
         if(param1 == GraphGroup.FPS)
         {
            _loc3_.col = 16724787;
         }
         else
         {
            _loc3_.col = 5267711;
         }
         _loc2_.interests.push(_loc3_);
         return _loc2_;
      }
      
      public function update(param1:Number = 0) : Array
      {
         var interest:GraphInterest = null;
         var v:Number = NaN;
         var group:GraphGroup = null;
         var ok:Boolean = false;
         var typ:uint = 0;
         var averaging:uint = 0;
         var interests:Array = null;
         var time:int = 0;
         var mspf:Number = NaN;
         var i:GraphInterest = null;
         var fps:Number = param1;
         for each(group in this._groups)
         {
            ok = true;
            if(group.freq > 1)
            {
               group.idle++;
               if(group.idle < group.freq)
               {
                  ok = false;
               }
               else
               {
                  group.idle = 0;
               }
            }
            if(ok)
            {
               typ = group.type;
               averaging = group.averaging;
               interests = group.interests;
               if(typ == GraphGroup.FPS)
               {
                  group.hi = fps;
                  interest = interests[0];
                  time = getTimer();
                  if(this._previousTime >= 0)
                  {
                     mspf = time - this._previousTime;
                     v = 1000 / mspf;
                     interest.setValue(v,averaging);
                  }
                  this._previousTime = time;
               }
               else if(typ == GraphGroup.MEM)
               {
                  interest = interests[0];
                  v = Math.round(System.totalMemory / 10485.76) / 100;
                  group.updateMinMax(v);
                  interest.setValue(v,averaging);
               }
               else
               {
                  for each(i in interests)
                  {
                     try
                     {
                        v = i.getCurrentValue();
                        i.setValue(v,averaging);
                     }
                     catch(e:Error)
                     {
                        report("Error with graph value for key [" + i.key + "] in [" + group.name + "]. " + e,10);
                        remove(group.name,i.obj,i.prop);
                     }
                     group.updateMinMax(v);
                  }
               }
            }
         }
         return this._groups;
      }
   }
}
