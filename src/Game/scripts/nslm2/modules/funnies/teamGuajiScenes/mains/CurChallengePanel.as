package nslm2.modules.funnies.teamGuajiScenes.mains
{
   import game.ui.teamGuajiScenes.mains.CurChallengePanelUI;
   import nslm2.mgrs.stcMgrs.vos.StcGuajiVo;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.GuajiInfoRes;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.customs.expands.MornExpandUtil;
   
   public class CurChallengePanel extends CurChallengePanelUI
   {
       
      
      private var bossDead:Boolean;
      
      private var bossID:int;
      
      private var oriX:int;
      
      private var oriY:int;
      
      private var stcGuajiVo:StcGuajiVo;
      
      private var btnEff:BmcSpriteSheet;
      
      public function CurChallengePanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnChangeClick);
         img_bossHead.mask = iconMask;
         bossSay.visible = false;
         oriX = bossSay.x;
         oriY = bossSay.y;
      }
      
      protected function hideBossSay(param1:MouseEvent) : void
      {
         bossSay.txt_talk.text = LocaleMgr.ins.getStr(41210124);
         bossSay.visible = true;
         TweenLite.killTweensOf(bossSay);
         TweenLite.to(bossSay,0.3,{"alpha":0});
      }
      
      protected function showBossSay(param1:MouseEvent) : void
      {
         TweenLite.killTweensOf(bossSay);
         bossSay.alpha = 1;
         bossSay.x = oriX;
         bossSay.y = oriY;
         TweenLite.from(bossSay,0.3,{
            "y":bossSay.y + 50,
            "x":bossSay.x + 20,
            "alpha":0
         });
      }
      
      private function onBtnChangeClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_killBoss !== _loc3_)
         {
            if(this.btn_changeLvl === _loc3_)
            {
               ModuleMgr.ins.showModule(41211);
            }
         }
         else if(bossDead)
         {
            ModuleMgr.ins.showModule(41211);
         }
         else
         {
            goToKillBoss(null);
         }
      }
      
      public function update(param1:GuajiInfoRes) : void
      {
         bossDead = false;
         var _loc4_:int = param1.curGuajiId;
         stcGuajiVo = StcMgr.ins.getGuajiVo(param1.curGuajiId);
         list.array = WealthUtil.costStrToArr(stcGuajiVo.client_drop_desc);
         var _loc6_:String = LocaleMgr.ins.getStr(41210800 + _loc4_);
         var _loc3_:String = LocaleMgr.ins.getStr(41210800 + _loc4_ + 1);
         txt_tip1.text = LocaleMgr.ins.getStr(41210002) + _loc6_;
         if(_loc4_ + 1 > 108)
         {
            txt_tip3.text = LocaleMgr.ins.getStr(41210920);
         }
         else
         {
            txt_tip3.text = LocaleMgr.ins.getStr(999000464) + _loc3_;
         }
         if(param1.maxPassedGuajiId != 0)
         {
            if(_loc4_ != param1.maxPassedGuajiId + 1)
            {
               bossDead = true;
            }
         }
         var _loc5_:StcNpcGroupVo = StcMgr.ins.getNpcGroupVo(stcGuajiVo.boss_group_id);
         bossID = _loc5_.display_npc;
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(bossID);
         img_bossHead.url = HeroInfoUtil.getHeadIconUrl(null,_loc2_.id);
         txt_bossName.text = HeroInfoUtil.getNpcQualityName(_loc2_.id);
         if(!bossDead)
         {
            box_head.buttonMode = false;
            box_head.addEventListener("rollOver",showBossSay);
            box_head.addEventListener("rollOut",hideBossSay);
            box_head.addEventListener("click",goToKillBoss);
         }
         else
         {
            box_head.buttonMode = false;
            box_head.removeEventListener("click",goToKillBoss);
            box_head.removeEventListener("rollOver",showBossSay);
            box_head.removeEventListener("rollOut",hideBossSay);
         }
         if(bossDead)
         {
            txt_dead.visible = true;
            box_head.disabled = true;
            btn_killBoss.label = LocaleMgr.ins.getStr(41210125);
            showBtnEff(true);
         }
         else
         {
            txt_dead.visible = false;
            box_head.disabled = false;
            btn_killBoss.label = LocaleMgr.ins.getStr(41210126);
            showBtnEff(false);
         }
      }
      
      protected function goToKillBoss(param1:MouseEvent) : void
      {
         if(PlayerModel.ins.level < stcGuajiVo.boss_lv_limit)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210812,[stcGuajiVo.boss_lv_limit]));
            AlertUtil.lackLevel(stcGuajiVo.boss_lv_limit);
            return;
         }
         ObserverMgr.ins.sendNotice("KILL_BOSS",bossID);
      }
      
      private function showBtnEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(115002,1,"all",true);
               btnEff.x = btn_changeLvl.x - 8;
               btnEff.y = btn_changeLvl.y - 10;
               this.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      override public function dispose() : void
      {
         box_head.removeEventListener("rollOver",showBossSay);
         box_head.removeEventListener("rollOut",hideBossSay);
         if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
         super.dispose();
      }
   }
}
