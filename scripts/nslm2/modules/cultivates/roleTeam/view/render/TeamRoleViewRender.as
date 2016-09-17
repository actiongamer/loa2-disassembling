package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.TeamRoleViewRenderUI;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import nslm2.modules.footstones.tooltipsModules.ToolTipYuanFenVo;
   
   public class TeamRoleViewRender extends TeamRoleViewRenderUI
   {
       
      
      private var _data:RoleTeamVo;
      
      private var filterMed:RoleGrowFilterMed;
      
      public function TeamRoleViewRender()
      {
         super();
         this.toolTip = getMengYueTip;
         filterMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         .super.dataSource = param1;
         _data = param1 as RoleTeamVo;
         if(_data)
         {
            if(_data.heroData)
            {
               _loc3_ = StcMgr.ins.getNpcVo(_data.heroData.baseId);
               if(_loc3_)
               {
                  txt_name.color = ColorLib.qualityColor(_loc3_.quality);
               }
               img_icon.url = UrlLib.npcDialogIcon(_loc3_.node + "");
               _loc2_ = MengYuePropVo.getActivateMengYueCnt(HeroInfoUtil.getNodeId(_data.heroData.baseId),_data.heroData.mengyue,1);
               txt_num.text = _loc2_ + "/4";
               txt_name.text = HeroInfoUtil.getNameHasTupoLevel(_data.heroData.baseId);
               filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc3_.quality));
               img_frame.skin = "png.uiRoleTeam.img_panel" + _loc3_.quality;
               img_group.visible = true;
               img_group.url = UrlLib.npcGroupImg(_loc3_.group);
               this.img_group.toolTip = new ToolTipNpcGroupVo(_loc3_.group);
            }
            else
            {
               this.visible = false;
            }
         }
      }
      
      private function getMengYueTip() : ToolTipYuanFenVo
      {
         var _loc1_:ToolTipYuanFenVo = new ToolTipYuanFenVo([]);
         _loc1_.mengYueArr = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(_data.heroData.baseId),_data.heroData.mengyue,null,1);
         return _loc1_;
      }
   }
}
