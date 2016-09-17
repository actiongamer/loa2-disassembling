package nslm2.modules.foundations.worldMap
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class WorlMapUtil
   {
      
      private static const mapID:Array = [10001];
      
      private static var preStageIdArr:Array;
      
      private static var hasPromptId:Array = [];
       
      
      public function WorlMapUtil()
      {
         super();
      }
      
      public static function checkOpenNewCity(param1:int) : void
      {
         var _loc3_:* = null;
         if(!preStageIdArr)
         {
            preStageIdArr = [];
            var _loc5_:int = 0;
            var _loc4_:* = mapID;
            for each(var _loc2_ in mapID)
            {
               _loc3_ = StcMgr.ins.getStageVo(_loc2_);
               if(_loc3_)
               {
                  preStageIdArr.push(_loc3_.prev_stage_id);
               }
            }
         }
         if(preStageIdArr.indexOf(param1) >= 0)
         {
            if(hasPromptId.indexOf(param1) < 0)
            {
               ObserverMgr.ins.sendNotice("msg_open_new_city");
               hasPromptId.push(param1);
            }
         }
      }
   }
}
