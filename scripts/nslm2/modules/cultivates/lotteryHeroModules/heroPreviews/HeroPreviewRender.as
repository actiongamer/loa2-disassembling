package nslm2.modules.cultivates.lotteryHeroModules.heroPreviews
{
   import game.ui.lotteryHeroModules.heroPreviews.HeroPreviewRenderUI;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import flash.events.MouseEvent;
   import morn.core.utils.StringUtils;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcCarrerVo;
   import morn.customs.FilterLib;
   
   public class HeroPreviewRender extends HeroPreviewRenderUI
   {
       
      
      private var filterMed:RoleGrowFilterMed;
      
      public function HeroPreviewRender()
      {
         super();
         filterMed = new RoleGrowFilterMed(this.img_bg,null);
         this.parts.push(new RoleGrowFilterMed(this.img_bg,null));
         this.addEventListener("click",onMouseClick);
         this.img_icon.mask = this.img_mask;
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(StringUtils.isNull(this.stcNpcVo.get_point.toString()))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000064));
         }
         else
         {
            _loc2_ = new RoleInfoModuleParam();
            _loc2_.init(HeroInfoUtil.createFakeHeroInfoByNpcVo(this.stcNpcVo),30100,true);
            ModuleMgr.ins.showModule(30100,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function get stcNpcVo() : StcNpcVo
      {
         return this.dataSource as StcNpcVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(stcNpcVo)
         {
            this.toolTip = this.stcNpcVo;
            if(ClientConfig.isChineseLang())
            {
               this.txt_name.text = HeroInfoUtil.getName(null,stcNpcVo.id,false);
               this.txt_name.color = ColorLib.qualityColor(stcNpcVo.quality);
               this.txt_name2.text = "";
            }
            else
            {
               this.txt_name2.text = HeroInfoUtil.getName(null,stcNpcVo.id,false);
               this.txt_name2.color = ColorLib.qualityColor(stcNpcVo.quality);
               this.txt_name.text = HeroInfoUtil.getName(null,stcNpcVo.id,true);
               this.txt_name.color = ColorLib.qualityColor(stcNpcVo.quality);
            }
            this.img_icon.url = UrlLib.npcDialogIcon(stcNpcVo.head_id);
            this.img_career.skin = UrlLib.npcTypeIcon(stcNpcVo.career_id);
            this.img_career.toolTip = new ToolTipNpcCarrerVo(stcNpcVo.career_id);
            this.img_bg.url = UrlLib.npcQualityBg(stcNpcVo.quality);
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(stcNpcVo.quality));
         }
         else
         {
            this.toolTip = null;
         }
      }
   }
}
