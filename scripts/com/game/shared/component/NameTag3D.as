package com.game.shared.component
{
   import org.specter3d.utils.IDisplayObjectPool;
   import com.mz.core.configs.ClientConfig;
   import flash.geom.Vector3D;
   import flash.system.Capabilities;
   import morn.customs.FilterLib;
   import flash.filters.GlowFilter;
   
   public class NameTag3D extends TextField3Dx implements IDisplayObjectPool
   {
       
      
      private var _color:String;
      
      private var _name:String;
      
      private var _nameHeight:int;
      
      private var _poolType:String;
      
      public function NameTag3D(param1:Number = 128, param2:Number = 32, param3:Array = null, param4:String = null)
      {
         var _loc5_:* = null;
         if(Capabilities.os.indexOf("Mac") == -1)
         {
            _loc5_ = FilterLib.macBrushFilter;
         }
         else
         {
            _loc5_ = FilterLib.brushFilter;
         }
         super(param1,param2,[_loc5_],param4);
      }
      
      public function get poolType() : String
      {
         if(_poolType == null)
         {
            _poolType = "monster_name_prefix_" + _name;
         }
         return _poolType;
      }
      
      override public function setText(param1:String = "", param2:String = "#32FFFF", param3:int = 12, param4:String = "SimSun", param5:Boolean = false) : void
      {
         if(ClientConfig.isRuLang())
         {
            param4 = "Arial";
         }
         _name = param1;
         _color = param2;
         super.setText(param1,param2,param3,param4,param5);
      }
      
      public function changeColor(param1:String) : void
      {
         if(_color != param1)
         {
            super.setText(_name,param1);
         }
      }
      
      public function changeName(param1:String) : void
      {
         if(param1 != _name)
         {
            super.setText(param1,_color);
         }
      }
      
      override public function set position(param1:Vector3D) : void
      {
         .super.position = param1;
         _nameHeight = param1.y;
      }
      
      public function get nameHeight() : int
      {
         return _nameHeight;
      }
      
      public function poolDispose() : void
      {
      }
   }
}
