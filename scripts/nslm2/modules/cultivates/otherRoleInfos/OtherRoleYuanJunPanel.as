package nslm2.modules.cultivates.otherRoleInfos
{
   import game.ui.otherRoleInfos.panel.OtherRoleYuanJunPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import nslm2.modules.cultivates.roleTeam.view.HeroYuanfenInfoBox;
   import nslm2.modules.cultivates.roleTeam.view.render.TeamRoleViewRender;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.common.compsEffects.FloatZoomInEffCtrl;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import morn.customs.expands.MornExpandUtil;
   
   public class OtherRoleYuanJunPanel extends OtherRoleYuanJunPanelUI implements IViewStackPage
   {
       
      
      private var YUAFENLIST_GAP:int = 6;
      
      private var mengYuePanel:RoleMengYuePanel;
      
      public function OtherRoleYuanJunPanel()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         list_yuanjun.useMouseDown = false;
         pane_team.list_teamHero.changeHandler = selectHeroHandler;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         list_yuanjun.dataSource = OtherRoleInfoModel.ins.yuanJunArr;
         txt_bottomtxt.text = LocaleMgr.ins.getStr(30100031,[OtherRoleInfoModel.ins.totalYuanFengCnt + "/" + (OtherRoleInfoModel.ins.getPositionList().length - 1) * 4]);
         showTeamInfoPanel();
         pane_team.list_teamHero.dataSource = OtherRoleInfoModel.ins.teamHeroArrWithoutPlayer;
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function get model() : OtherRoleInfoModel
      {
         return OtherRoleInfoModel.ins;
      }
      
      private function selectHeroHandler(param1:int, param2:int) : void
      {
         showYuanFenListPanel(param1);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_yuafen !== _loc2_)
         {
            if(btn_back === _loc2_)
            {
               showTeamInfoPanel();
            }
         }
         else
         {
            showYuanFenListPanel();
         }
      }
      
      private function showYuanFenListPanel(param1:int = 0) : void
      {
         txt_des.text = LocaleMgr.ins.getStr(30100030);
         this.pane_team.visible = false;
         box_yuafenDetail.visible = true;
         btn_back.visible = true;
         btn_yuafen.visible = false;
         updateYuanFenlistPanel(param1);
      }
      
      private function showTeamInfoPanel() : void
      {
         btn_back.visible = false;
         btn_yuafen.visible = true;
         txt_des.text = LocaleMgr.ins.getStr(999000079);
         this.pane_team.visible = true;
         box_yuafenDetail.visible = false;
      }
      
      private function updateYuanFenlistPanel(param1:int) : void
      {
         var _loc7_:* = null;
         var _loc2_:* = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Array = model.teamHeroArrWithoutPlayer;
         var _loc6_:int = _loc4_.length;
         panel_yuanfen.removeAllChild();
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc3_ = _loc4_[_loc8_] as RoleTeamVo;
            if(_loc3_.heroData)
            {
               _loc7_ = new HeroYuanfenInfoBox();
               _loc7_.setHeroInfo(_loc3_.heroData);
               _loc7_.y = _loc5_;
               if(_loc8_ == param1)
               {
                  _loc2_ = _loc5_;
               }
               _loc5_ = _loc5_ + (_loc7_.height + YUAFENLIST_GAP);
               panel_yuanfen.addChild(_loc7_);
            }
            _loc8_++;
         }
         panel_yuanfen.scrollTo(0,_loc2_);
      }
      
      private function findRender(param1:UInt64) : TeamRoleViewRender
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = pane_team.list_teamHero.dataSource as Array;
         var _loc4_:int = _loc3_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            if(Uint64Util.equal(_loc6_.heroData.id,param1))
            {
               _loc2_ = pane_team.list_teamHero.getCell(_loc5_) as TeamRoleViewRender;
               break;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function alertFloatCpl(param1:TeamRoleViewRender) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(param1)
         {
            new FloatZoomInEffCtrl(param1.txt_num);
         }
         pane_team.list_teamHero.dataSource = OtherRoleInfoModel.ins.teamHeroArrWithoutPlayer;
      }
      
      public function set layer3dRef(param1:UIPanel3D) : void
      {
      }
   }
}
