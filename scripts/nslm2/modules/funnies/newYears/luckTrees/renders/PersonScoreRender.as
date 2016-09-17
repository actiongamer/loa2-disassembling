package nslm2.modules.funnies.newYears.luckTrees.renders
{
   import game.ui.newYears.luckTrees.renders.PersonScoreRenderUI;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import proto.StaticLuckTreeScoreRewardModel;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PersonScoreRender extends PersonScoreRenderUI
   {
       
      
      public function PersonScoreRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         btn_get.label = LocaleMgr.ins.getStr(60540017);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_get === _loc3_)
         {
            this.service.server_luckTreeGetReward(1,this.vo.score,getHandler);
         }
      }
      
      private function getHandler() : void
      {
         this.refreshUI();
      }
      
      public function get vo() : StaticLuckTreeScoreRewardModel
      {
         return this.dataSource as StaticLuckTreeScoreRewardModel;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.refreshUI();
         }
      }
      
      private function refreshUI() : void
      {
         this.txt_lv.text = String(vo.score);
         this.list_gift.array = WealthUtil.costStrToArr(vo.item);
         switch(int(this.service.personRewardState(vo.score)) - 1)
         {
            case 0:
               this.btn_get.visible = true;
               this.btn_get.disabled = true;
               this.img_get.visible = false;
               break;
            case 1:
               this.btn_get.visible = true;
               this.btn_get.disabled = false;
               this.img_get.visible = false;
               break;
            case 2:
               this.btn_get.visible = false;
               this.img_get.visible = true;
         }
      }
   }
}
