package nslm2.modules.foundations.friendModules.mains
{
   import game.ui.friendModules.mains.FriendSubListRenderUI;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.LabelMed;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.tipMenus.TipMenuMsg;
   import nslm2.common.uiEffects.RollTweenSelectBoxMed;
   
   public class FriendSubListRender extends FriendSubListRenderUI
   {
       
      
      public function FriendSubListRender()
      {
         super();
         this.nameUseLink = false;
         this.doubleClickEnabled = true;
         this.parts.push(new RollTweenSelectBoxMed(this,this.img_roll));
         this.addEventListener("click",this_onClick);
         this.addEventListener("doubleClick",this_onDbClick);
      }
      
      protected function this_onDbClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_CLOSE");
         if(FriendService.ins.isFriend(this.playerVo.playerId))
         {
            ModuleMgr.ins.showModule(10540,this.playerVo.playerId,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.playerVo)
         {
            this.txt_name.text = LabelMed.vipParam(this.playerVo.vipInfoVo) + this.playerVo.name;
            if(this.playerVo.offtime != 0)
            {
               this.filters = FilterLib.ins.getFilterArr(402);
            }
            else
            {
               this.filters = null;
            }
         }
      }
      
      private function this_onClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TIP_MENU_SHOW",new TipMenuMsg(102,this.playerVo));
      }
   }
}
