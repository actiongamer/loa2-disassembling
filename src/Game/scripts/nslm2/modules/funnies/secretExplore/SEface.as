package nslm2.modules.funnies.secretExplore
{
   import game.ui.secretExplore.SEfaceUI;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import proto.MjtxEnemyInfo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.vo.PlayerVo;
   import nslm2.utils.LabelMed;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   
   public class SEface extends SEfaceUI
   {
       
      
      public var index:int = 0;
      
      public var _data:MjtxEnemyInfo;
      
      private var isSelf:Boolean = false;
      
      private var isFighted:Boolean = false;
      
      private var glowEffCtl:GlowFilterBreathCtrl;
      
      public function SEface()
      {
         super();
         this.btn_fight.alpha = 0;
         this.btn_help.alpha = 0;
         this.btn_fight.clickHandler = onFight;
         this.btn_help.clickHandler = onHelp;
         this.btn_fight.toolTip = LocaleMgr.ins.getStr(50700106);
         this.btn_help.toolTip = LocaleMgr.ins.getStr(50700105);
         this.img_kill.visible = false;
      }
      
      private function onFight(param1:* = null) : void
      {
         ObserverMgr.ins.sendNotice("OPT_SECRET_EXPLORE_FIGHT",index);
      }
      
      private function onHelp() : void
      {
         ObserverMgr.ins.sendNotice("OPT_SECRET_EXPLORE_HELP",index);
      }
      
      private function onRO(param1:MouseEvent) : void
      {
         TweenLite.to(this.btn_fight,0.2,{"alpha":1});
         TweenLite.to(this.btn_help,0.2,{"alpha":1});
      }
      
      private function onROO(param1:MouseEvent) : void
      {
         TweenLite.to(this.btn_fight,0.2,{"alpha":0});
         TweenLite.to(this.btn_help,0.2,{"alpha":0});
      }
      
      public function setEnemy(param1:MjtxEnemyInfo) : void
      {
         var _loc2_:* = null;
         _data = param1;
         this.hpbar.value = param1.hpPercent / 100;
         WealthUtil.changeQualitySkin(this.img_quality,MilitaryModel.ins.getPlayerQuality(param1.baseInfo.militaryRank));
         this.img_icon.url = HeroInfoUtil.getHeadIconUrl(param1.baseInfo.id,param1.baseInfo.npcId);
         txt_name.text = LinkUtils.playerNameSmart(param1.baseInfo.id,param1.baseInfo.name,param1.baseInfo.dist,ColorLib.getMilitaryColor(param1.baseInfo.militaryRank));
         if(ClientConfig.isChineseLang())
         {
            _loc2_ = int(Uint64Util.toNumber(param1.baseInfo.ability) / 10000) + "W";
         }
         else
         {
            _loc2_ = int(Uint64Util.toNumber(param1.baseInfo.ability) / 1000) + "K";
         }
         this.txt_pow.text = LocaleMgr.ins.getStr(50500030,[TextFieldUtil.htmlText2(_loc2_,11137387)]);
         this.img_icon.toolTip = param1;
         if(param1.buffLayer > 0)
         {
            this.img_buff.visible = true;
            img_buff.toolTip = LocaleMgr.ins.getStr(50700126,[Math.min(param1.buffLayer,9) * 10]);
         }
         else
         {
            this.img_buff.visible = false;
         }
      }
      
      public function get isfighted() : Boolean
      {
         if(isSelf)
         {
            return true;
         }
         return _data.isDead;
      }
      
      public function setSelf(param1:PlayerVo) : void
      {
         isSelf = true;
         this.removeEventListener("rollOver",onRO);
         this.removeEventListener("rollOut",onROO);
         this.btn_fight.visible = false;
         this.btn_help.visible = false;
         this.hpbar.visible = false;
         this.txt_pow.visible = false;
         if(param1 && param1.quality != 0)
         {
            WealthUtil.changeQualitySkin(this.img_quality,param1.quality);
         }
         if(param1 && param1.headerIconUrl != null)
         {
            this.img_icon.url = param1.headerIconUrl;
         }
         this.txt_name.text = LabelMed.vipParam(param1.vipInfoVo) + LinkUtils.playerName(param1.playerId,param1.name,param1.disID,ColorLib.qualityColor(param1.militaryQuality));
      }
      
      public function fightedMode() : void
      {
         isFighted = true;
         var _loc1_:* = true;
         this.img_icon.visible = _loc1_;
         _loc1_ = _loc1_;
         this.img_quality.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_pow.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_name.visible = _loc1_;
         this.hpbar.visible = _loc1_;
         img_kill.visible = true;
         this.img_icon.filters = [FilterUtil.blackWhiteFilter()];
         this.img_quality.filters = [FilterUtil.blackWhiteFilter()];
         this.removeEventListener("rollOver",onRO);
         this.removeEventListener("rollOut",onROO);
         this.btn_fight.visible = false;
         this.btn_help.visible = false;
         this.img_icon.removeEventListener("click",onFight);
         this.img_icon.buttonMode = false;
         if(glowEffCtl)
         {
            glowEffCtl.dispose();
            glowEffCtl = null;
            img_bg.filters = [];
         }
      }
      
      public function inFightMode() : void
      {
         if(isFighted)
         {
            return;
         }
         var _loc1_:* = true;
         this.img_icon.visible = _loc1_;
         _loc1_ = _loc1_;
         this.img_quality.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_pow.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_name.visible = _loc1_;
         this.hpbar.visible = _loc1_;
         img_kill.visible = false;
         this.addEventListener("rollOver",onRO);
         this.addEventListener("rollOut",onROO);
         this.btn_fight.visible = true;
         this.btn_help.visible = true;
         this.img_icon.addEventListener("click",onFight);
         this.img_icon.buttonMode = true;
         if(!glowEffCtl)
         {
            glowEffCtl = new GlowFilterBreathCtrl(FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(7))).addHandler(breath_cb).set_duration(1);
         }
      }
      
      override public function dispose() : void
      {
         if(glowEffCtl)
         {
            glowEffCtl.dispose();
            glowEffCtl = null;
            img_bg.filters = [];
         }
         super.dispose();
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.img_bg.filters = param1;
      }
      
      public function unknowMode() : void
      {
         this.removeEventListener("rollOver",onRO);
         this.removeEventListener("rollOut",onROO);
         var _loc1_:* = false;
         this.img_icon.visible = _loc1_;
         _loc1_ = _loc1_;
         this.img_quality.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_pow.visible = _loc1_;
         _loc1_ = _loc1_;
         this.txt_name.visible = _loc1_;
         this.hpbar.visible = _loc1_;
         this.btn_fight.visible = false;
         this.btn_help.visible = false;
         img_kill.visible = false;
         this.img_icon.removeEventListener("click",onFight);
         this.img_icon.buttonMode = false;
         if(glowEffCtl)
         {
            glowEffCtl.dispose();
            glowEffCtl = null;
            img_bg.filters = [];
         }
      }
   }
}
