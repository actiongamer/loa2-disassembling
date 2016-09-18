package com.mz.core.geom
{
   import flash.geom.Point;
   
   public class PoiAndRoVo
   {
      
      public static const POI:String = "poi";
      
      public static const RO:String = "ro";
      
      public static const PLAYERID:String = "playerid";
       
      
      public var poi:Point;
      
      public var ro:int;
      
      public var playerId:String;
      
      public function PoiAndRoVo(param1:Point = null, param2:int = 0, param3:String = null)
      {
         super();
         this.poi = param1;
         this.ro = param2;
         this.playerId = param3;
      }
      
      public function parse(param1:*) : void
      {
         this.poi = param1.poi;
         this.ro = param1.ro;
         this.playerId = param1.playerId;
      }
      
      public function clone() : PoiAndRoVo
      {
         var _loc1_:PoiAndRoVo = new PoiAndRoVo();
         _loc1_.poi = this.poi;
         _loc1_.ro = this.ro;
         _loc1_.playerId = this.playerId;
         return _loc1_;
      }
   }
}
