package nslm2.modules.funnies.guildPKCrossSer.comp
{
   import game.ui.guildPKCrossSer.GPKChallengeRenderUI;
   import flash.events.MouseEvent;
   import nslm2.mgrs.MouseIconManager;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import proto.FamilyExpeTaskNotify;
   import nslm2.modules.funnies.guildPKCrossSer.GPKConst;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FamilyExpeStartReq;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyExpeFamilyInfo;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   import com.mz.core.utils.TextFieldUtil;
   
   public class GPKStartRender extends GPKChallengeRenderUI
   {
       
      
      public function GPKStartRender()
      {
         super();
         this.btn_start.clickHandler = startClick;
         this.btn_start.addEventListener("rollOver",onMover);
         this.btn_start.addEventListener("rollOut",onMout);
      }
      
      override public function dispose() : void
      {
         this.btn_start.removeEventListener("rollOver",onMover);
         this.btn_start.removeEventListener("rollOut",onMout);
         super.dispose();
      }
      
      protected function onMout(param1:MouseEvent) : void
      {
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      protected function onMover(param1:MouseEvent) : void
      {
         MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
      }
      
      private function startClick() : void
      {
         AlertUtil.comfirm(LocaleMgr.ins.getStr(30610224,[txt_me_name.text.split(" ")[1]]),confirmHandler,null,null);
      }
      
      private function confirmHandler() : void
      {
         var _loc1_:FamilyExpeTaskNotify = GPKCModel.ins.curTask;
         if(_loc1_ && _loc1_.taskId > 0 && _loc1_.taskState == GPKConst.task_no_get)
         {
            ServerEngine.ins.send(4361);
            AlertUtil.float(LocaleMgr.ins.getStr(50700022));
         }
         var _loc2_:FamilyExpeStartReq = new FamilyExpeStartReq();
         _loc2_.familyId = vo.familyId;
         ServerEngine.ins.send(4351,_loc2_,onStartRet);
      }
      
      private function onStartRet() : void
      {
         ModuleMgr.ins.closeModule(40761);
      }
      
      public function get vo() : FamilyExpeFamilyInfo
      {
         return dataSource as FamilyExpeFamilyInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(!param1)
         {
            return;
         }
         img_flag_bg.url = GuildUtil.getFlagBgUrl(vo.flagBase);
         img_flag_icon.url = GuildUtil.getFlagIconUrl(vo.flagIcon);
         this.txt_me_name.text = "Lv." + vo.familyLv + " " + GPKConst.getDistStr(vo.familyOpName,vo.familyDist,vo.familyName);
         this.img_power.skin = "png.uiGuildPKCrossSer.img_power" + GPKCModel.ins.getPowerStatus(vo.ability);
         powerTxt.text = LocaleMgr.ins.getStr(999900112 + GPKCModel.ins.getPowerStatus(vo.ability));
         this.txt_me_info.text = LocaleMgr.ins.getStr(41701004) + "：" + TextFieldUtil.htmlText2(GPKConst.powerToW(vo.ability),11137387) + "\n" + LocaleMgr.ins.getStr(30610225) + TextFieldUtil.htmlText2(vo.avaiNum + "/" + vo.totalNum,11137387) + "\n" + LocaleMgr.ins.getStr(41701006) + "：" + TextFieldUtil.htmlText2(vo.reputation,11137387) + "\n" + LocaleMgr.ins.getStr(30610226) + TextFieldUtil.htmlText2(vo.rank,11137387) + "\n" + LocaleMgr.ins.getStr(30610227,[TextFieldUtil.htmlText2(vo.winReputation,11137387),TextFieldUtil.htmlText2(vo.failReputation,11137387)]);
      }
   }
}
