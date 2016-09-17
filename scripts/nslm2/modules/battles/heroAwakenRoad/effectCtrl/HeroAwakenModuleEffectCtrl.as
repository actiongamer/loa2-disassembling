package nslm2.modules.battles.heroAwakenRoad.effectCtrl
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class HeroAwakenModuleEffectCtrl implements IDispose
   {
      
      private static var _ins:nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenModuleEffectCtrl;
       
      
      public function HeroAwakenModuleEffectCtrl()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenModuleEffectCtrl
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.battles.heroAwakenRoad.effectCtrl.HeroAwakenModuleEffectCtrl();
         }
         return _ins;
      }
      
      private function get model() : HeroAwakenRoadModel
      {
         return HeroAwakenRoadModel.ins;
      }
      
      public function exec() : void
      {
         showStarAdd();
         showChapterCpl();
         showNewStage();
      }
      
      public function showNewStage() : void
      {
         if(model.newOpenStageId != 0)
         {
            ObserverMgr.ins.sendNotice("evtNewDungeon",model.newOpenStageId);
         }
         model.newOpenStageId = 0;
      }
      
      public function showChapterCpl() : void
      {
         if(model.newChapterIndex != 0)
         {
            ObserverMgr.ins.sendNotice("evtChapterCpl");
         }
         model.newChapterIndex = 0;
      }
      
      public function showStarAdd() : void
      {
         if(model.addStarCnt != 0)
         {
            ObserverMgr.ins.sendNotice("evtChapterStarCntAdded");
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
