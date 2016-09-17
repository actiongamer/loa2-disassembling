package nslm2.modules.funnies.families.familyBosses.view
{
   import game.ui.familyBosses.HornorRankUI;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler;
   import proto.FamilyBossSupperRankData;
   
   public class FamilyBossHornorRankModule extends HornorRankUI
   {
       
      
      public function FamilyBossHornorRankModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         list_rank.dataSource = [];
         box_detail.visible = false;
         if(!FamilyBossModel.ins.hornorRank || FamilyBossModel.ins.hornorRank.length < 1)
         {
            FamilyBossServiceHandler.ins.getHornorRank();
         }
         else
         {
            updateRankData();
         }
         super.preShow(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["family_boss_update_hornor_rank"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("family_boss_update_hornor_rank" === _loc3_)
         {
            updateRankData();
         }
      }
      
      private function updateRankData() : void
      {
         var _loc1_:* = null;
         list_rank.dataSource = FamilyBossModel.ins.hornorRank;
         if(FamilyBossModel.ins.hornorRank.length > 0)
         {
            _loc1_ = FamilyBossModel.ins.hornorRank[0];
            if(_loc1_)
            {
               box_detail.visible = true;
               list_detailRank.dataSource = _loc1_.members;
               txt_totalDmg.text = _loc1_.totalhurt + "";
            }
         }
      }
   }
}
