package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.render.OtherRoleListRenderUI;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class OtherRoleListRender extends OtherRoleListRenderUI
   {
       
      
      private var _data:RoleTeamVo;
      
      public function OtherRoleListRender()
      {
         super();
         txt_openLvl.mouseEvent = false;
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
         txt_openLvl.visible = false;
         img_lock.visible = false;
         if(panelBaseInfo)
         {
            _loc2_ = StcMgr.ins.getNpcVo(panelBaseInfo.baseId);
            WealthUtil.changeQualitySkin(this.img_quality,StcMgr.ins.getNpcVo(panelBaseInfo.baseId).quality);
            this.img_icon.url = HeroInfoUtil.getHeadIconUrl(panelBaseInfo.id,panelBaseInfo.baseId);
            this.parts.push(new RollHighLightMediator(this));
            this.buttonMode = true;
         }
         else
         {
            WealthUtil.changeQualitySkin(this.img_quality,1);
            this.img_icon.url = null;
            if(OtherRoleInfoModel.ins.playerHero.baseInfo.level < _data.openLvl)
            {
               img_lock.visible = true;
               txt_openLvl.visible = true;
               txt_openLvl.text = LocaleMgr.ins.getStr(999000078,[TextFieldUtil.htmlText2(_data.openLvl,458496)]);
            }
         }
      }
   }
}
