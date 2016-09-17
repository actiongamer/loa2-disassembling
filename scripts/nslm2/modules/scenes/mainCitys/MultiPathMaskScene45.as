package nslm2.modules.scenes.mainCitys
{
   import nslm2.modules.scenes.commons.SceneModel;
   import flash.geom.Point;
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import proto.ScenePlayerInfo;
   
   public class MultiPathMaskScene45 extends Scene45Base
   {
      
      public static const OTHER_PLAYER_SIDE:int = 1;
       
      
      public var otherPlayerMaskIndex:int = 1;
      
      public var maskIndex:Array;
      
      public function MultiPathMaskScene45()
      {
         maskIndex = [0,0];
         super();
      }
      
      override protected function init3D() : void
      {
         SceneModel.ins.findPathMed.initFindPathMedVector(maskIndex);
         super.init3D();
      }
      
      override protected function getOtherPlayerPos(param1:Point) : Point
      {
         return SceneModel.ins.findPathMed.getCanMovePoiNearest(param1,otherPlayerMaskIndex);
      }
      
      override public function addOtherRole(param1:ScenePlayerInfo, param2:Boolean = true, param3:Boolean = false) : ScenePlayer3D
      {
         var _loc4_:ScenePlayer3D = super.addOtherRole(param1,param2,param3);
         _loc4_.side = otherPlayerMaskIndex;
         return _loc4_;
      }
   }
}
