package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.TeamHeroListRenderUI;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.common.compsEffects.FlickerEffCtrl;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.model.HeroModel;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class TeamHeroListRender extends TeamHeroListRenderUI
   {
       
      
      private var _data:RoleTeamVo;
      
      private var flickerTxtExpPre:FlickerEffCtrl;
      
      public function TeamHeroListRender()
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
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as RoleTeamVo;
         this.mouseEnabled = true;
         this.mouseChildren = true;
         img_plus.visible = false;
         txt_openLvl.visible = false;
         img_lock.visible = false;
         img_redPoint.visible = false;
         if(panelBaseInfo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(panelBaseInfo.baseId);
            if(HeroModel.ins.isCurPlayerHeroByStcNpcId(panelBaseInfo.baseId))
            {
               WealthUtil.changeQualitySkin(this.img_quality,MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank));
            }
            else
            {
               WealthUtil.changeQualitySkin(this.img_quality,StcMgr.ins.getNpcVo(panelBaseInfo.baseId).quality);
            }
            this.img_icon.url = HeroInfoUtil.getHeadIconUrl(panelBaseInfo.id,panelBaseInfo.baseId);
            if(flickerTxtExpPre)
            {
               flickerTxtExpPre.dispose();
            }
            if(SkinModel.ins.getSkinAvailArrByNpcId(_loc2_.node).length > 0 && !LocalData.insCurPlayer.load("evtSkinSelect",false) || SkinModel.ins.canActiveByNpcId(_loc2_.node))
            {
               img_redPoint.visible = true;
            }
            else
            {
               img_redPoint.visible = false;
            }
         }
         else
         {
            WealthUtil.changeQualitySkin(this.img_quality,1);
            this.img_icon.url = null;
            if(PlayerModel.ins.level >= _data.openLvl)
            {
               if(!flickerTxtExpPre)
               {
                  flickerTxtExpPre = new FlickerEffCtrl(img_plus,1);
               }
               flickerTxtExpPre.resume();
               img_plus.visible = true;
            }
            else
            {
               img_lock.visible = true;
               txt_openLvl.visible = true;
               img_redPoint.visible = false;
               txt_openLvl.text = LocaleMgr.ins.getStr(999000090,[TextFieldUtil.htmlText2(_data.openLvl,458496)]);
            }
         }
      }
   }
}
