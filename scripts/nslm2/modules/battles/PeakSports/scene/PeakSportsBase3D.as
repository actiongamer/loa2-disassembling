package nslm2.modules.battles.PeakSports.scene
{
   import nslm2.modules.scenes.commons.ScenePlayer3D;
   import flash.geom.Point;
   import nslm2.modules.battles.PeakSports.model.PeakFlagModel;
   import nslm2.modules.battles.PeakSports.type.PeakSportsTempType;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.battles.PeakSports.model.PeakSportsModel;
   import nslm2.modules.scenes.commons.SceneModel;
   import away3d.containers.ObjectContainer3D;
   
   public class PeakSportsBase3D extends ScenePlayer3D
   {
       
      
      public function PeakSportsBase3D(param1:ObjectContainer3D = null)
      {
         super(param1);
      }
      
      public function initName() : void
      {
      }
      
      override protected function countRunPath(param1:int, param2:int) : Array
      {
         var _loc3_:Point = this.pos2d.clone();
         var _loc6_:int = side;
         var _loc5_:uint = PeakFlagModel.ins.bkGameStageInfoNotify.startStamp + int(PeakSportsTempType.BK_WAITING_TIME) + PeakSportsTempType.battleTime - PeakSportsTempType.dieModelTime;
         if(ServerTimer.ins.second > _loc5_ || PeakSportsModel.ins.step == 1)
         {
            _loc6_ = 3;
         }
         var _loc4_:Array = SceneModel.ins.findPathMed.getMovePath(_loc3_,new Point(param1,param2),false,_loc6_);
         return _loc4_;
      }
   }
}
