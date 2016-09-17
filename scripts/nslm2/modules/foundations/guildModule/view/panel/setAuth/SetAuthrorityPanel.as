package nslm2.modules.foundations.guildModule.view.panel.setAuth
{
   import game.ui.guildModules.setting.SetAuthorityPanelUI;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.guildModule.service.GuildServiceHandler;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.guildModule.vo.AuthorityVo;
   import morn.customs.expands.MornExpandUtil;
   
   public class SetAuthrorityPanel extends SetAuthorityPanelUI
   {
       
      
      private var model:GuildModel;
      
      public function SetAuthrorityPanel()
      {
         model = GuildModel.ins;
         super();
         this.comb_pos.selectHandler = changePosHandler;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         this.list_staticAuth.mouseEnabled = false;
         this.list_staticAuth.mouseChildren = false;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_left !== _loc2_)
         {
            if(btn_right === _loc2_)
            {
               list_commonAuth.dataSource = model.resetNormalAuth(pos);
            }
         }
         else
         {
            GuildServiceHandler.ins.setNormalAuthority(pos,authArr,setSuccessHandler);
         }
      }
      
      private function setSuccessHandler(param1:Object) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(40700020));
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(model.isPresident())
         {
            this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(40700018);
         }
         else
         {
            this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(40700019);
         }
         var _loc2_:* = model.isPresident();
         this.btn_right.visible = _loc2_;
         this.btn_left.visible = _loc2_;
         this.list_commonAuth.mouseEnabled = model.isPresident();
         this.list_commonAuth.mouseChildren = model.isPresident();
         this.comb_pos.labels = model.getAllPosNamesArr();
         this.comb_pos.selectedIndex = model.crtPosIndex;
         super.preShow(param1);
      }
      
      private function get pos() : int
      {
         var _loc1_:int = 13 - comb_pos.selectedIndex;
         _loc1_ = _loc1_ < 1?1:_loc1_;
         return _loc1_;
      }
      
      private function changePosHandler(param1:int) : void
      {
         this.list_staticAuth.dataSource = model.getSuperAuthByPos(pos);
         this.list_commonAuth.dataSource = model.getNormalAuthByPos(pos);
      }
      
      private function get authArr() : Array
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc1_:Array = list_commonAuth.dataSource as Array;
         var _loc2_:Array = [];
         var _loc4_:int = _loc1_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc1_[_loc5_];
            if(_loc3_.selected)
            {
               _loc2_.push(_loc3_.id);
            }
            _loc5_++;
         }
         return _loc2_;
      }
   }
}
