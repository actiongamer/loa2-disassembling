package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.SelectTeamHeroRenderUI;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamHeroVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class SelectTeamHeroRender extends SelectTeamHeroRenderUI
   {
       
      
      private var _data:RoleTeamHeroVo;
      
      public function SelectTeamHeroRender()
      {
         super();
         btn_select.clickHandler = selecteHandler;
      }
      
      override protected function validateTooltip() : void
      {
         img_icon.toolTip = WealthUtil.tooltip(WealthUtil.panelBaseInfoToVo(_data.heroInfo));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _data = param1 as RoleTeamHeroVo;
         if(_data)
         {
            .super.dataSource = WealthUtil.panelBaseInfoToVo(_data.heroInfo);
            _loc3_ = StcMgr.ins.getNpcVo(_data.heroInfo.baseId);
            txt_type.text = LocaleMgr.ins.getStr(5000 + _loc3_.career_id);
            txt_lvl.text = LocaleMgr.ins.getStr(999000089) + _data.heroInfo.level;
            txt_group.text = LocaleMgr.ins.getStr(5100 + _loc3_.group);
            _loc2_ = _data.yuanFenDataArr.length;
            if(_loc2_ > 0)
            {
               txt_yuanfen.text = LocaleMgr.ins.getStr(999000088) + "+" + _loc2_;
            }
            else
            {
               txt_yuanfen.text = "";
            }
            img_group.url = UrlLib.npcGroupImg(_loc3_.group);
            this.img_group.toolTip = new ToolTipNpcGroupVo(_loc3_.group);
         }
      }
      
      private function selecteHandler(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("role_team_notice_select_new_member",_data.heroInfo.id);
      }
   }
}
