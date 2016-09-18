package nslm2.modules.foundations.friendModules.searches
{
   import game.ui.friendModules.searches.FriendSearchOneModuleUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.UIMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import morn.core.utils.StringUtils;
   import proto.PlayerFriendSearchReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import proto.PlayerFriendSearchRes;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.GameFriendData;
   import proto.PlayerFriendApplyReq;
   import proto.PlayerFriendApplyRes;
   import nslm2.utils.ProtoUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class FriendSearchOneModule extends FriendSearchOneModuleUI
   {
       
      
      public function FriendSearchOneModule()
      {
         super();
         this.txt_search.text = "";
         this.txt_search.addEventListener("enter",this.onSearch);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(10600030);
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         UIMgr.stage.focus = this.txt_search.textField;
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_search === _loc3_)
         {
            this.onSearch();
         }
      }
      
      private function onSearch(... rest) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = StringUtils.trim(this.txt_search.text);
         if(_loc2_)
         {
            _loc3_ = new PlayerFriendSearchReq();
            _loc3_.name = _loc2_;
            ServerEngine.ins.send(7013,_loc3_,server_searchCpl);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(10602001));
         }
      }
      
      private function server_searchCpl(param1:PlayerFriendSearchRes) : void
      {
         if(!FriendService.ins.isFriend(param1.data.id))
         {
            friendApply(param1.data);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300007203));
         }
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      public function friendApply(param1:GameFriendData) : void
      {
         var _loc2_:PlayerFriendApplyReq = new PlayerFriendApplyReq();
         _loc2_.id = param1.id;
         ServerEngine.ins.send(7024,_loc2_,server_friendapplyCpl);
      }
      
      public function server_friendapplyCpl(param1:PlayerFriendApplyRes) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(10602004,ProtoUtils.parseParaArr([param1.content])));
      }
   }
}
