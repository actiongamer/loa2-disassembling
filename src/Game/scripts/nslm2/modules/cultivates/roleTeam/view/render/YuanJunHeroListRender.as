package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.YuanJunHeroListRenderUI;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class YuanJunHeroListRender extends YuanJunHeroListRenderUI
   {
       
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      private var _data:YuanJunVo;
      
      public function YuanJunHeroListRender()
      {
         super();
         txt_openLvl.mouseEvent = false;
         this.parts.push(new RollHighLightMediator(this));
      }
      
      public function get panelBaseInfo() : PanelBaseInfo
      {
         return _data.heroData;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as YuanJunVo;
         this.mouseEnabled = true;
         this.mouseChildren = true;
         img_plus.visible = false;
         img_redPoint.visible = false;
         txt_openLvl.visible = false;
         img_lock.visible = false;
         img_group.visible = false;
         if(panelBaseInfo)
         {
            _loc3_ = StcMgr.ins.getNpcVo(panelBaseInfo.baseId);
            WealthUtil.changeQualitySkin(this.img_quality,StcMgr.ins.getNpcVo(panelBaseInfo.baseId).quality);
            this.img_icon.url = HeroInfoUtil.getHeadIconUrl(panelBaseInfo.id,panelBaseInfo.baseId);
            _loc2_ = StcMgr.ins.getNpcVo(_data.heroData.baseId);
            if(_loc2_)
            {
               txt_name.color = ColorLib.qualityColor(_loc2_.quality);
            }
            txt_name.text = HeroInfoUtil.getNameHasTupoLevel(_data.heroData.baseId);
            if(flickerTxtExpPre)
            {
               flickerTxtExpPre.dispose();
               flickerTxtExpPre = null;
            }
            this.img_group.toolTip = new ToolTipNpcGroupVo(_loc3_.group);
            img_group.visible = true;
            img_group.url = UrlLib.npcGroupImg(_loc3_.group);
         }
         else
         {
            WealthUtil.changeQualitySkin(this.img_quality,1);
            this.img_icon.url = null;
            txt_name.text = "";
            if(PlayerModel.ins.level >= _data.openLvl)
            {
               img_plus.visible = true;
               img_redPoint.visible = HeroModel.ins.hasIdleYuanJun();
               if(!flickerTxtExpPre)
               {
                  flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
                  flickerTxtExpPre.resume();
               }
            }
            else
            {
               txt_openLvl.visible = true;
               txt_openLvl.text = LocaleMgr.ins.getStr(999000078,[TextFieldUtil.htmlText2(_data.openLvl,458496)]);
               img_lock.visible = true;
               if(EnvConfig.ins.showDevModule || FuncOpenAutoCtrl.checkOpen(30815))
               {
                  showIsNotOpen();
               }
            }
         }
      }
      
      private function showIsNotOpen() : void
      {
         this.mouseEnabled = false;
         this.mouseChildren = false;
         txt_openLvl.visible = true;
         txt_openLvl.text = LocaleMgr.ins.getStr(999000078,[TextFieldUtil.htmlText2(_data.openLvl,458496)]);
         img_lock.visible = true;
      }
   }
}
