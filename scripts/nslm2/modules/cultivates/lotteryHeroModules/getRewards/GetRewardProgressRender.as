package nslm2.modules.cultivates.lotteryHeroModules.getRewards
{
   import game.ui.lotteryHeroModules.getRewards.GetRewardProgressRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import morn.customs.FilterLib;
   
   public class GetRewardProgressRender extends GetRewardProgressRenderUI
   {
       
      
      public function GetRewardProgressRender()
      {
         super();
         this.img_icon.buttonMode = true;
         this.parts.push(new RoleGrowFilterMed(this.img_icon,FilterLib.TEXT_GROW_SELECTED_FILTER));
         this.addEventListener("click",onClick);
      }
      
      public function get vo() : GetRewardVo
      {
         return this.dataSource as GetRewardVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.dataSource)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(5100 + vo.groupId);
         }
      }
      
      public function get canGet() : Boolean
      {
         return vo.canGet;
      }
      
      public function set canGet(param1:Boolean) : void
      {
         vo.canGet = param1;
         this.dataSource = vo;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.closeModule(11920);
         ModuleMgr.ins.showModule(11920,this.vo);
      }
   }
}
