package nslm2.modules.funnies.teamPKCS.preMatch
{
   import com.mz.core.interFace.IDispose;
   import game.ui.teamPKCS.pre.TPKCpreSceneUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import proto.CTeamMemberInfo;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaRankRes;
   import morn.core.components.Button;
   
   public class TPKCRankCtrl implements IDispose
   {
       
      
      private var _skin:TPKCpreSceneUI;
      
      private var currPage:int = 1;
      
      private var allPage:int = 1;
      
      private var _dispose:Boolean;
      
      private var _res:CteamArenaRankRes;
      
      public function TPKCRankCtrl(param1:TPKCpreSceneUI)
      {
         super();
         _skin = param1;
         _skin.list_rank.itemRender = TPKCRankRender;
         _skin.pageBarUI.btn_next.clickHandler = clickHandler;
         _skin.pageBarUI.btn_prev.clickHandler = clickHandler;
         _skin.btn_next_more.clickHandler = clickHandler;
         _skin.btn_prev_more.clickHandler = clickHandler;
         _dispose = false;
         _skin.list_rank.dataSource = [];
         _skin.list_rank.repeatY = 5;
         _skin.tab.selectHandler = tabChangeHandler;
         _skin.tab.selectedIndex = 0;
         _skin.left_my_tip.text = LocaleMgr.ins.getStr(50800064);
      }
      
      private function tabChangeHandler(param1:int) : void
      {
         currPage = 1;
         if(param1 == 0)
         {
            rankMode();
         }
         else if(param1 == 1)
         {
            myTeamMode();
         }
      }
      
      private function myTeamMode() : void
      {
         _skin.tt1.text = LocaleMgr.ins.getStr(11000854);
         _skin.tt2.text = LocaleMgr.ins.getStr(50200002);
         _skin.tt3.text = LocaleMgr.ins.getStr(50800062);
         setMemberList();
         _skin.pageBarUI.visible = false;
         _skin.btn_next_more.visible = false;
         _skin.btn_prev_more.visible = false;
         _skin.left_my_tip.visible = true;
      }
      
      private function rankMode() : void
      {
         _skin.tt1.text = LocaleMgr.ins.getStr(9030810);
         _skin.tt2.text = LocaleMgr.ins.getStr(11000810);
         _skin.pageBarUI.visible = true;
         _skin.btn_next_more.visible = true;
         _skin.btn_prev_more.visible = true;
         _skin.left_my_tip.visible = false;
         reqData();
      }
      
      public function refreshTeamMember() : void
      {
         if(_skin.tab.selectedIndex == 1)
         {
            setMemberList();
         }
      }
      
      public function setMemberList() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:Array = TPKCModel.ins.preInfo.our.member;
         _loc2_.sortOn(CTeamMemberInfo.SCORE.name,16 | 2);
         var _loc1_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = new CTeamMemberVo();
            _loc3_.rank = _loc4_ + 1;
            _loc3_.info = _loc2_[_loc4_];
            _loc1_.push(_loc3_);
            _loc4_++;
         }
         _skin.list_rank.dataSource = _loc1_;
      }
      
      public function reqData() : void
      {
         if(_skin.tab.selectedIndex != 0)
         {
            _skin.tab.selectedIndex = 0;
         }
         ServerEngine.ins.send(5404,null,rankInfoReturn);
      }
      
      private function rankInfoReturn(param1:CteamArenaRankRes) : void
      {
         if(param1 == null)
         {
            return;
         }
         TPKCModel.ins.myRank = param1.rank;
         _skin.txt_l3.text = LocaleMgr.ins.getStr(50800056,[param1.score,param1.rank]);
         _res = param1;
         allPage = Math.ceil(param1.info.length / 5);
         refreshList();
      }
      
      private function refreshList() : void
      {
         var _loc1_:int = (currPage - 1) * 5;
         _skin.list_rank.array = _res.info.slice(_loc1_,_loc1_ + 5);
         _skin.pageBarUI.txt_pageNum.text = currPage + "/" + allPage;
      }
      
      private function clickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(_skin.pageBarUI.btn_next !== _loc2_)
         {
            if(_skin.pageBarUI.btn_prev !== _loc2_)
            {
               if(_skin.btn_next_more !== _loc2_)
               {
                  if(_skin.btn_prev_more === _loc2_)
                  {
                     currPage = currPage - 5;
                  }
               }
               else
               {
                  currPage = currPage + 5;
               }
            }
            else
            {
               currPage = Number(currPage) - 1;
            }
         }
         else
         {
            currPage = Number(currPage) + 1;
         }
         if(currPage > allPage)
         {
            currPage = allPage;
         }
         if(currPage < 1)
         {
            currPage = 1;
         }
         refreshList();
      }
      
      public function dispose() : void
      {
         _dispose = true;
      }
   }
}
