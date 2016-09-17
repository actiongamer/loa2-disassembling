package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.teamPKCS.finalMatch.TPKCGambleModuleUI;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.netease.protobuf.UInt64;
   import proto.CteamArenaFinalBetReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CteamArenaFinalBetInfo;
   import nslm2.utils.Uint64Util;
   import proto.CteamArenaFinalBetInfoRes;
   import proto.CTeamInfo;
   import nslm2.modules.funnies.teamPKCS.preMatch.CTeamMemberVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.ServerTimer;
   import morn.customs.expands.MornExpandUtil;
   
   public class TPKCGambleModule extends TPKCGambleModuleUI
   {
       
      
      private var _gambleIndex:int;
      
      private var _res:CteamArenaFinalBetInfoRes;
      
      private var _arr:Array;
      
      private var phase:int;
      
      public function TPKCGambleModule()
      {
         super();
         this.list_fightResult.itemRender = TPKCFightResultRender;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         panelBg.bgCustom.addChild(this.img_gambleBg);
         panelBg.bgCustom.addChild(this.img_upbg);
         var _loc1_:String = "0";
         this.rightScore.text = _loc1_;
         this.leftScore.text = _loc1_;
      }
      
      public function get model() : TPKCModel
      {
         return TPKCModel.ins;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_gambleLeft !== _loc2_)
         {
            if(btn_gambleRight === _loc2_)
            {
               if(canGamble())
               {
                  _gambleIndex = 2;
                  gamble(_arr[3],_arr[1]);
               }
            }
         }
         else if(canGamble())
         {
            _gambleIndex = 1;
            gamble(_arr[3],_arr[0]);
         }
      }
      
      private function canGamble() : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         if(model.phase > 0)
         {
            _loc3_ = (model.phase - 1) % 5;
            _loc2_ = (model.phase - 1) / 5;
            if(_loc3_ == 0 && _loc2_ == phase)
            {
               _loc1_ = true;
            }
         }
         if(_loc1_ == false)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50800089));
         }
         return _loc1_;
      }
      
      private function gamble(param1:uint, param2:UInt64) : void
      {
         var _loc3_:CteamArenaFinalBetReq = new CteamArenaFinalBetReq();
         _loc3_.index = param1;
         _loc3_.team = param2;
         ServerEngine.ins.send(5416,_loc3_,gambleSuccessHandler);
      }
      
      private function gambleSuccessHandler() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(50800090));
         switch(int(_gambleIndex) - 1)
         {
            case 0:
               this.btn_gambleLeft.label = LocaleMgr.ins.getStr(50800091);
               break;
            case 1:
               this.btn_gambleRight.label = LocaleMgr.ins.getStr(50800091);
         }
         var _loc1_:Boolean = true;
         btn_gambleRight.disabled = _loc1_;
         btn_gambleLeft.disabled = _loc1_;
      }
      
      private function refreshBtnGamble() : void
      {
         var _loc1_:int = 0;
         var _loc3_:* = LocaleMgr.ins.getStr(50800092);
         this.btn_gambleRight.label = _loc3_;
         this.btn_gambleLeft.label = _loc3_;
         _loc3_ = true;
         this.btn_gambleRight.disabled = _loc3_;
         this.btn_gambleLeft.disabled = _loc3_;
         if(_res && _res.info)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _res.info;
            for each(var _loc2_ in _res.info)
            {
               if(_loc2_.index == _arr[3])
               {
                  if(Uint64Util.equal(_loc2_.team,_arr[0]))
                  {
                     this.btn_gambleLeft.label = LocaleMgr.ins.getStr(50800091);
                     _loc3_ = true;
                     this.btn_gambleRight.disabled = _loc3_;
                     this.btn_gambleLeft.disabled = _loc3_;
                     return;
                  }
                  if(Uint64Util.equal(_loc2_.team,_arr[1]))
                  {
                     this.btn_gambleRight.label = LocaleMgr.ins.getStr(50800091);
                     _loc3_ = true;
                     this.btn_gambleRight.disabled = _loc3_;
                     this.btn_gambleLeft.disabled = _loc3_;
                     return;
                  }
               }
            }
         }
         if(model.phase > 0)
         {
            _loc1_ = (model.phase - 1) / 5;
            if(phase == _loc1_)
            {
               _loc3_ = false;
               this.btn_gambleRight.disabled = _loc3_;
               this.btn_gambleLeft.disabled = _loc3_;
            }
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(5414,null,onInfoRet);
      }
      
      private function onInfoRet(param1:CteamArenaFinalBetInfoRes) : void
      {
         _res = param1;
         moduleServerCpl();
      }
      
      private function getTeamArrById(param1:UInt64) : CTeamInfo
      {
         var _loc2_:Array = model.finalRes.team;
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            if(Uint64Util.equal(_loc3_.id,param1))
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function teamMemArrToTeamVoArr(param1:Array, param2:UInt64) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc4_ = new CTeamMemberVo();
            _loc4_.info = param1[_loc5_];
            _loc4_.order = _loc5_ + 1;
            _loc4_.leaderId = param2;
            _loc3_.push(_loc4_);
            _loc5_++;
         }
         return _loc3_;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         var _loc3_:Array = String(DefindConsts.CROSS_GROUP_CHIPIN_ODDS).split("|");
         var _loc2_:Array = String(DefindConsts.CROSS_GROUP_CHIPIN_COST).split(":");
         this.txt_bet_win.text = LocaleMgr.ins.getStr(50800109,[int(_loc2_[2]) * int(_loc3_[phase]) + int(_loc2_[2])]);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc11_:* = 0;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         super.preShow(param1);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(50400301);
         this.img_gambleBg.skin = UrlLib.tpkcUrl("img_gambleBg.png");
         var _loc14_:Boolean = false;
         btn_gambleRight.disabled = _loc14_;
         btn_gambleLeft.disabled = _loc14_;
         _arr = param1 as Array;
         phase = TPKConst.indexToPhase(TPKConst.sIdToCId(_arr[3]));
         this.txt_fightInfo.text = LocaleMgr.ins.getStr(TPKConst.titARr[phase]);
         var _loc2_:Array = [model.time_arr_32to16,model.time_arr_16to8,model.time_arr_8to4,model.time_arr_4to2,model.time_arr_2to1];
         this.txt_betTime.text = LocaleMgr.ins.getStr(50800112,[_loc2_[phase][0],_loc2_[phase][1]]);
         this.left_need.dataSource = WealthUtil.parseCostStr(DefindConsts.CROSS_GROUP_CHIPIN_COST);
         this.right_need.dataSource = WealthUtil.parseCostStr(DefindConsts.CROSS_GROUP_CHIPIN_COST);
         txt_betTime.visible = false;
         if(model.isHalfDay)
         {
            if(phase >= 0 && phase <= 1)
            {
               _loc11_ = uint(TPKCModel.tStrToSec(_loc2_[phase][0]));
               txt_betTime.visible = ServerTimer.ins.second < _loc11_;
            }
         }
         else if(model.isFinalDay)
         {
            if(phase >= 2 && phase <= 4)
            {
               _loc11_ = uint(TPKCModel.tStrToSec(_loc2_[phase][0]));
               txt_betTime.visible = ServerTimer.ins.second < _loc11_;
            }
         }
         var _loc4_:CTeamInfo = getTeamArrById(_arr[0]);
         var _loc12_:CTeamInfo = getTeamArrById(_arr[1]);
         this.fightValue_left.txt_fightValue.value = Uint64Util.toNumber(_loc4_.ability);
         this.fightValue_right.txt_fightValue.value = Uint64Util.toNumber(_loc12_.ability);
         this.txt_nameLeft.text = TPKConst.getDistName(_loc4_.op,_loc4_.dist,_loc4_.name);
         this.txt_nameRight.text = TPKConst.getDistName(_loc12_.op,_loc12_.dist,_loc12_.name);
         var _loc9_:Array = TPKConst.setOrder(_loc4_.member,_loc4_.sort);
         var _loc6_:Array = TPKConst.setOrder(_loc12_.member,_loc12_.sort);
         this.list_leftMems.dataSource = teamMemArrToTeamVoArr(_loc9_,_loc4_.leader);
         this.list_rightMems.dataSource = teamMemArrToTeamVoArr(_loc6_,_loc12_.leader);
         this.txt_bet_win.text = "";
         refreshBtnGamble();
         if(_arr[2])
         {
            _loc7_ = _arr[2].report;
            _loc5_ = [];
            _loc3_ = 0;
            _loc13_ = 0;
            _loc10_ = 0;
            _loc8_ = 0;
            while(_loc8_ < _loc7_.length)
            {
               if(_loc10_ < 3)
               {
                  _loc5_.push({
                     "data":_loc7_[_loc8_],
                     "index":_loc8_,
                     "time":_loc2_[phase][_loc8_ + 2]
                  });
                  if(_loc7_[_loc8_].pos == 1)
                  {
                     _loc3_++;
                  }
                  else
                  {
                     _loc13_++;
                  }
                  _loc10_++;
                  _loc8_++;
                  continue;
               }
               break;
            }
            this.leftScore.text = _loc3_ + "";
            this.rightScore.text = _loc13_ + "";
            this.list_fightResult.dataSource = _loc5_;
         }
         else
         {
            this.list_fightResult.dataSource = [];
         }
      }
   }
}
