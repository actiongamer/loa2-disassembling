package nslm2.modules.battles.PeakSports.control
{
   import nslm2.modules.battles.PeakSports.type.PeakSportsMsgs;
   import com.mz.core.event.MzEvent;
   import nslm2.common.model.PlayerModel;
   import com.netease.protobuf.UInt64;
   
   public class PeakSportsCurPlayerControl extends PeakSportsPlayerBaseControl
   {
       
      
      public function PeakSportsCurPlayerControl()
      {
         super();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            PeakSportsMsgs.ins.addEventListener("msgStopRun",onStopRun);
         }
         else
         {
            PeakSportsMsgs.ins.removeEventListener("msgStopRun",onStopRun);
         }
      }
      
      private function onStopRun(param1:MzEvent) : void
      {
         if(PlayerModel.ins.isCurPlayer(param1.data as UInt64))
         {
            this.player.stopRun();
         }
      }
   }
}
