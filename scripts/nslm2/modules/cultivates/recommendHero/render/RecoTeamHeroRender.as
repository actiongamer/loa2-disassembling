package nslm2.modules.cultivates.recommendHero.render
{
   import game.ui.recommendHero.render.RecoTeamHeroRenderUI;
   import proto.PanelBaseInfo;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.tooltipsModules.ToolTipYuanFenVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.model.HeroModel;
   import com.mz.core.utils.FilterUtil;
   
   public class RecoTeamHeroRender extends RecoTeamHeroRenderUI
   {
       
      
      private var _panelBaseInfo:PanelBaseInfo;
      
      public function RecoTeamHeroRender()
      {
         super();
      }
      
      private function get vo() : PanelBaseInfo
      {
         return _panelBaseInfo;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onClick);
         }
         else
         {
            this.removeEventListener("click",onClick);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.wealthVo.stcNpcVo.get_point == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000064));
         }
         else
         {
            _loc2_ = new RoleInfoModuleParam();
            _loc2_.init(HeroInfoUtil.createFakeHeroInfoByNpcVo(StcMgr.ins.getNpcVo(vo.baseId)),30100,true);
            ModuleMgr.ins.showModule(30100,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         if(param1)
         {
            _panelBaseInfo = param1 as PanelBaseInfo;
            .super.dataSource = WealthUtil.createNpcVo(vo.baseId);
            this.toolTip = ToolTipYuanFenVo.getMengYueTip(vo.baseId,vo.mengyue,null,1);
            this.txt_yuanfen.text = LocaleMgr.ins.getStr(30100049) + TextFieldUtil.htmlText2(_panelBaseInfo.mengyue.length,458496);
            if(HeroModel.ins.getHeroNodeCount(vo.baseId) > 0)
            {
               if(this.ref_img_icon != null)
               {
                  this.ref_img_icon.filters = null;
               }
            }
            else if(this.ref_img_icon != null)
            {
               this.ref_img_icon.filters = [FilterUtil.grayFilter()];
            }
            switchEventListeners(true);
         }
         else
         {
            switchEventListeners(false);
         }
      }
   }
}
