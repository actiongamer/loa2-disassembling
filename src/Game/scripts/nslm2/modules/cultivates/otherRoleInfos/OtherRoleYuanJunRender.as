package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.render.OtherRoleYuanJunRenderUI;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.mediators.RollHighLightMediator;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class OtherRoleYuanJunRender extends OtherRoleYuanJunRenderUI
   {
       
      
      private var _data:YuanJunVo;
      
      public function OtherRoleYuanJunRender()
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
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as YuanJunVo;
         this.mouseEnabled = true;
         this.mouseChildren = true;
         txt_openLvl.visible = false;
         img_lock.visible = false;
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
            this.parts.push(new RollHighLightMediator(this));
            this.buttonMode = true;
         }
         else
         {
            WealthUtil.changeQualitySkin(this.img_quality,1);
            this.img_icon.url = null;
            txt_name.text = "";
            if(_data.index == 6)
            {
               this.mouseEnabled = false;
               this.mouseChildren = false;
               txt_openLvl.visible = true;
               txt_openLvl.text = LocaleMgr.ins.getStr(999000080);
               img_lock.visible = true;
               return;
            }
            if(OtherRoleInfoModel.ins.playerHero.baseInfo.level < _data.openLvl)
            {
               txt_openLvl.visible = true;
               txt_openLvl.text = LocaleMgr.ins.getStr(999000078,[TextFieldUtil.htmlText2(_data.openLvl,458496)]);
               img_lock.visible = true;
            }
         }
      }
   }
}
