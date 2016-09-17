package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.teamPKCS.finalMatch.TPKCfinalSceneUI;
   import com.mz.core.interFace.IObserver;
   import game.ui.teamPKCS.finalMatch.TPKCHalfViewUI;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import flash.events.MouseEvent;
   import morn.core.components.Image;
   import proto.CteamArenaFinalTeamRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.foundations.AlertUtil;
   import proto.CteamArenaFinalStage;
   import com.netease.protobuf.UInt64;
   import morn.core.components.Button;
   import proto.CTeamInfo;
   import nslm2.modules.funnies.championShip.view.IProgressLine;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import proto.CteamArenaFinalBetInfoRes;
   import proto.CteamArenaFinalBetInfo;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.mainToolBar.MainToolBarBackMsg;
   import com.greensock.TweenLite;
   
   public class TPKCFinalScene extends TPKCfinalSceneUI implements IObserver
   {
       
      
      private var ui_halfView:TPKCHalfViewUI;
      
      private var _scene3D:nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalView3D;
      
      private var _lookMode:Boolean;
      
      private var index:int = 0;
      
      private var _halfPoints:Array;
      
      public function TPKCFinalScene(param1:Boolean = false)
      {
         var _loc2_:int = 0;
         super();
         _lookMode = param1;
         _scene3D = new nslm2.modules.funnies.teamPKCS.finalMatch.TPKCFinalView3D(this);
         addChild(_scene3D);
         _scene3D.init();
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            Image(this["btn_up" + _loc2_]).addEventListener("click",onTabchg);
            _loc2_++;
         }
         dataRet();
         model.addEventListener("OPT_TPKC_NEW_EVENT_HAPPEN",onEventHappen);
         ObserverMgr.ins.regObserver(this);
         ObserverMgr.ins.sendNotice("main_tool_bar_back_add",new MainToolBarBackMsg(42000,this.btnBack_handler,null));
      }
      
      public function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function btnBack_handler() : void
      {
         if(_lookMode)
         {
            ObserverMgr.ins.sendNotice("OPT_TPKC_BACK_TO_INVITEMODE");
         }
         else
         {
            ModuleMgr.ins.closeModule(42000);
         }
      }
      
      private function onEventHappen(param1:Event) : void
      {
         e = param1;
         eventRefresh = function():void
         {
            changeTab(index);
         };
         stageHandler();
         reqTeamInfo(eventRefresh);
      }
      
      private function dataRet() : void
      {
         changeTab(0);
         var _loc3_:int = (model.phase - 1) / 5;
         _loc3_ = Math.max(0,_loc3_);
         var _loc2_:Array = [model.time_arr_32to16,model.time_arr_16to8,model.time_arr_8to4,model.time_arr_4to2,model.time_arr_2to1];
         var _loc1_:Array = [];
         if(model.isHalfDay)
         {
            titleTxt.text = LocaleMgr.ins.getStr(999900218);
            _loc1_.push(LocaleMgr.ins.getStr(TPKConst.titARr[_loc3_]));
            _loc1_.push(_loc2_[_loc3_][0],_loc2_[_loc3_][1],_loc2_[_loc3_][1],_loc2_[_loc3_][2],_loc2_[_loc3_][2],_loc2_[_loc3_][3],_loc2_[_loc3_][3],_loc2_[_loc3_][4]);
            this.ui_halfView.txt_time_info.text = LocaleMgr.ins.getStr(50800113,_loc1_);
         }
         else if(model.isFinalDay)
         {
            if(model.phase == 10)
            {
               _loc3_ = model.phase / 5;
            }
            titleTxt.text = LocaleMgr.ins.getStr(999900219);
            _loc1_.push(LocaleMgr.ins.getStr(TPKConst.titARr[_loc3_]));
            _loc1_.push(_loc2_[_loc3_][0],_loc2_[_loc3_][1],_loc2_[_loc3_][1],_loc2_[_loc3_][2],_loc2_[_loc3_][2],_loc2_[_loc3_][3],_loc2_[_loc3_][3],_loc2_[_loc3_][4]);
            this.ui_halfView.txt_time_info.text = LocaleMgr.ins.getStr(50800113,_loc1_);
         }
         else
         {
            titleTxt.text = LocaleMgr.ins.getStr(999900218);
            this.ui_halfView.txt_time_info.text = "";
         }
         stageHandler();
      }
      
      private function stageHandler() : void
      {
         var _loc1_:int = 0;
         if(model.phase <= 0)
         {
            ui_halfView.txt_remind.text = "";
         }
         else
         {
            _loc1_ = (model.phase - 1) / 5;
            if(_loc1_ < 4)
            {
               ui_halfView.txt_remind.text = model.remindStr;
            }
            else
            {
               ui_halfView.txt_remind.text = "";
            }
         }
      }
      
      private function onTabchg(param1:MouseEvent) : void
      {
         var _loc3_:Image = param1.currentTarget as Image;
         var _loc2_:int = _loc3_.xmlVar.split("btn_up")[1];
         changeTab(_loc2_);
      }
      
      private function reqTeamInfo(param1:Function) : void
      {
         handler = param1;
         onTeamInfoRet = function(param1:CteamArenaFinalTeamRes):void
         {
            model.finalRes = param1;
            if(handler is Function)
            {
               handler();
            }
         };
         ServerEngine.ins.send(5413,null,onTeamInfoRet);
      }
      
      public function changeTab(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         this.index = param1;
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            if(_loc2_ == param1)
            {
               Image(this["btn_up" + _loc2_]).buttonMode = false;
               Image(this["btn_up" + _loc2_]).mouseEnabled = false;
               Image(this["btn_up" + _loc2_]).skin = "png.uiTeamPKCS.final.img_up1";
            }
            else
            {
               Image(this["btn_up" + _loc2_]).buttonMode = true;
               Image(this["btn_up" + _loc2_]).mouseEnabled = true;
               Image(this["btn_up" + _loc2_]).skin = "png.uiTeamPKCS.final.img_up0";
            }
            _loc2_++;
         }
         disposeHalfView();
         _scene3D.disposefinalView();
         if(param1 == 2)
         {
            updateFinalView();
         }
         else
         {
            updateHalfView();
         }
         refreshView();
      }
      
      private function refreshView() : void
      {
         var _loc1_:* = null;
         if(!model.finalRes)
         {
            return;
         }
         if(model.finalRes.team.length < 32)
         {
            AlertUtil.floatErr(LocaleMgr.ins.getStr(50800099));
            return;
         }
         ui_halfView.txt_info.text = "";
         if(index == 0)
         {
            _loc1_ = model.finalRes.team.slice(0,16);
            ui_halfView.list_players.dataSource = _loc1_;
            updateLine(0);
         }
         else if(index == 1)
         {
            _loc1_ = model.finalRes.team.slice(16,32);
            ui_halfView.list_players.dataSource = _loc1_;
            updateLine(1);
         }
         else if(index == 2)
         {
         }
      }
      
      private function updateLine(param1:int = 0) : void
      {
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc13_:* = null;
         var _loc8_:* = null;
         _halfPoints = [];
         var _loc11_:int = 0;
         _loc11_ = 0;
         while(_loc11_ < 15)
         {
            _loc6_ = getWinIdByPoint(_loc11_,param1);
            _loc2_ = !!_loc6_?_loc6_.win:null;
            _loc3_ = this.ui_halfView["btn_" + _loc11_];
            _loc3_.dataSource = _loc6_;
            _halfPoints.push(_loc2_);
            _loc11_++;
         }
         var _loc15_:int = 0;
         var _loc14_:* = ui_halfView.list_players.array;
         for each(var _loc10_ in ui_halfView.list_players.array)
         {
            _halfPoints.push(_loc10_.id);
         }
         _loc9_ = 1;
         while(_loc9_ <= 30)
         {
            _loc7_ = ui_halfView["line_" + _loc9_];
            _loc12_ = (_loc9_ - 1) / 2;
            _loc5_ = _halfPoints[_loc12_];
            _loc4_ = _halfPoints[_loc9_];
            if(_loc5_ && _loc4_ && Uint64Util.equal(_loc5_,_loc4_))
            {
               if(_loc9_ == 1 || _loc9_ == 2)
               {
                  _loc13_ = model.getCteamInfo(_loc5_);
                  ui_halfView.txt_info.text = TPKConst.getDistName(_loc13_.op,_loc13_.dist,_loc13_.name) + "\n" + LocaleMgr.ins.getStr(50800048) + "：" + TextFieldUtil.htmlText2(TPKConst.getLeader(_loc13_.leader,_loc13_.member).info.name,16773888);
               }
               _loc7_.highlight = true;
            }
            else
            {
               _loc7_.highlight = false;
            }
            _loc9_++;
         }
         _loc11_ = 0;
         while(_loc11_ < 15)
         {
            _loc8_ = getIdBypoint(_loc11_);
            this.ui_halfView["btn_" + _loc11_].disabled = _loc8_[0] == null || _loc8_[1] == null || Uint64Util.isZero(_loc8_[0]) || Uint64Util.isZero(_loc8_[1]);
            _loc11_++;
         }
      }
      
      private function checkBetTxt() : void
      {
         onInfoRet = function(param1:CteamArenaFinalBetInfoRes):void
         {
            var _loc3_:* = null;
            var _loc2_:int = 0;
            var _loc9_:int = 0;
            var _loc8_:int = 0;
            var _loc5_:* = null;
            var _loc6_:int = 0;
            var _loc4_:Boolean = false;
            var _loc10_:int = 0;
            _loc10_ = 0;
            while(_loc10_ < 15)
            {
               _loc3_ = ui_halfView["btn_" + _loc10_] as Button;
               ui_halfView["txt_c" + _loc10_].visible = false;
               if(!_loc3_.disabled)
               {
                  if(model.phase > 0)
                  {
                     _loc2_ = (model.phase - 1) / 5;
                     _loc9_ = (model.phase - 1) % 5;
                     _loc8_ = TPKConst.indexToPhase(_loc10_);
                     if(_loc8_ == _loc2_ && _loc9_ == 0)
                     {
                        _loc5_ = index == 0?TPKConst.half0:TPKConst.half1;
                        _loc6_ = _loc5_[_loc10_];
                        _loc4_ = false;
                        var _loc12_:int = 0;
                        var _loc11_:* = param1.info;
                        for each(var _loc7_ in param1.info)
                        {
                           if(_loc7_.index == _loc6_)
                           {
                              _loc4_ = true;
                              break;
                           }
                        }
                        if(!_loc4_)
                        {
                           ui_halfView["txt_c" + _loc10_].visible = true;
                        }
                     }
                  }
               }
               _loc10_++;
            }
         };
         ServerEngine.ins.send(5414,null,onInfoRet);
      }
      
      private function getWinIdByPoint(param1:int, param2:int = 0) : CteamArenaFinalStage
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         if(model.finalRes == null)
         {
            return null;
         }
         if(model.finalRes.index && model.finalRes.index.length > 0)
         {
            _loc3_ = param2 == 0?TPKConst.half0:TPKConst.half1;
            _loc5_ = _loc3_[param1];
            var _loc7_:int = 0;
            var _loc6_:* = model.finalRes.index;
            for each(var _loc4_ in model.finalRes.index)
            {
               if(_loc5_ == _loc4_.id)
               {
                  return _loc4_;
               }
            }
            return null;
         }
         return null;
      }
      
      public function updateHalfView() : void
      {
         if(!ui_halfView)
         {
            ui_halfView = new TPKCHalfViewUI();
            ui_halfView.txt_tips.text = LocaleMgr.ins.getStr(50800100);
            ui_halfView.btn_mybet.label = LocaleMgr.ins.getStr(50800094);
            MornExpandUtil.addHandlerForBtnAll(ui_halfView,half_btn_handler);
         }
         addChild(ui_halfView);
         this.swapChildren(this.box_bt,ui_halfView);
      }
      
      private function half_btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         if(param1 == ui_halfView.btn_mybet)
         {
            ModuleMgr.ins.showModule(42012);
         }
         else
         {
            _loc6_ = param1.xmlVar.split("btn_")[1];
            _loc4_ = getIdBypoint(_loc6_);
            if(_loc4_[0] == null || _loc4_[1] == null || Uint64Util.isZero(_loc4_[0]) || Uint64Util.isZero(_loc4_[1]))
            {
               AlertUtil.float("缺少数据");
            }
            else
            {
               _loc4_.push(param1.dataSource);
               _loc3_ = index == 0?TPKConst.half0:TPKConst.half1;
               _loc5_ = _loc3_[_loc6_];
               _loc4_.push(_loc5_);
               ModuleMgr.ins.showModule(42011,_loc4_);
            }
         }
      }
      
      private function openGambleFromMyBet(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc5_:* = model.finalRes.index;
         for each(var _loc2_ in model.finalRes.index)
         {
            if(param1 == _loc2_.id)
            {
               _loc4_ = _loc2_;
            }
         }
         if(_loc4_)
         {
            _loc3_ = _loc4_.team.concat();
            _loc3_.push(_loc4_);
            _loc3_.push(param1);
            ModuleMgr.ins.showModule(42011,_loc3_,42012);
         }
         else
         {
            AlertUtil.float("节点没生成");
         }
      }
      
      public function getIdBypoint(param1:int) : Array
      {
         var _loc2_:UInt64 = _halfPoints[param1 * 2 + 1];
         var _loc3_:UInt64 = _halfPoints[param1 * 2 + 2];
         return [_loc2_,_loc3_];
      }
      
      public function updateFinalView() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = model.finalRes.index;
         for each(var _loc1_ in model.finalRes.index)
         {
            if(_loc1_.id == 29)
            {
               _loc2_ = model.getCteamInfo(_loc1_.win);
            }
            else if(_loc1_.id == 30)
            {
               _loc3_ = model.getCteamInfo(_loc1_.win);
            }
         }
         _scene3D.showFinalView(_loc2_,_loc3_);
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         _scene3D.updateTitlePos();
      }
      
      public function disposeHalfView() : void
      {
         if(ui_halfView && ui_halfView.stage)
         {
            removeChild(ui_halfView);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["OPT_TPKC_SEE_TEAM_FROM_MY_BET"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("OPT_TPKC_SEE_TEAM_FROM_MY_BET" === _loc3_)
         {
            openGambleFromMyBet(param2.index);
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         ObserverMgr.ins.sendNotice("main_tool_bar_back_delete",new MainToolBarBackMsg(42000,this.btnBack_handler,null));
         ObserverMgr.ins.unregObserver(this);
         model.removeEventListener("OPT_TPKC_NEW_EVENT_HAPPEN",onEventHappen);
         if(ui_halfView)
         {
            ui_halfView.dispose();
         }
         TweenLite.killDelayedCallsTo(stageHandler);
         if(_scene3D)
         {
            _scene3D.dispose();
         }
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            Image(this["btn_up" + _loc1_]).removeEventListener("click",onTabchg);
            _loc1_++;
         }
         super.dispose();
      }
   }
}
