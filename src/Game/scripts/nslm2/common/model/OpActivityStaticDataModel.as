package nslm2.common.model
{
   import flash.events.EventDispatcher;
   import com.mz.core.utils.DictHash;
   import proto.OpActivityStatic;
   import nslm2.modules.funnies.groupon.model.GrouponModel;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.modules.funnies.newYears.day51s.services.Day51Service;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import nslm2.modules.funnies.busyActivity.dragonBoats.services.DragonBoatService;
   import nslm2.modules.foundations.shop.model.ShopModel;
   import proto.StaticOpActivity;
   import proto.StaticOpActivityTmModel;
   import proto.StaticZhuanPanTimeModel;
   import proto.StaticLuckTreeTimeModel;
   import proto.StaticMineSweepOpenModel;
   import nslm2.utils.RTools;
   import nslm2.modules.foundations.angelFund.model.AngelFundModel;
   import nslm2.modules.foundations.angelFund.service.AngelFundService;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.utils.ServerTimer;
   import proto.StaticQuestionModel;
   import nslm2.modules.funnies.busyActivity.questions.model.QuestionModel;
   import proto.StaticTowerModel;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import proto.StaticTowerModel.Row;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_Tower;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_TowerCost;
   import nslm2.utils.ProtoUtils;
   import proto.StaticOpActivity.Table;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.dials.consts.DialConsts;
   import proto.StaticTowerModel.KVPair;
   
   public class OpActivityStaticDataModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.common.model.OpActivityStaticDataModel;
      
      private static var _activityStaticDic:DictHash;
       
      
      private var _tuangouTimeArr:Array;
      
      private var _zhuanpanTimeArr:Array;
      
      private var _luckTreeTimeArr:Array;
      
      private var _day51TimeArr:Array;
      
      private var _dragonBoatTimeArr:Array;
      
      private var _fundTimeArr:Array;
      
      private var _crossZhuanpanTimeArr:Array;
      
      private var _towerTimeArr:Array;
      
      private var _questionTimeArr:Array;
      
      public function OpActivityStaticDataModel()
      {
         _tuangouTimeArr = [];
         _zhuanpanTimeArr = [];
         _luckTreeTimeArr = [];
         _day51TimeArr = [];
         _dragonBoatTimeArr = [];
         _fundTimeArr = [];
         _crossZhuanpanTimeArr = [];
         _towerTimeArr = [];
         _questionTimeArr = [];
         super();
         _activityStaticDic = new DictHash();
      }
      
      public static function get ins() : nslm2.common.model.OpActivityStaticDataModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.common.model.OpActivityStaticDataModel();
         }
         return _ins;
      }
      
      public function get activityStaticDic() : DictHash
      {
         return _activityStaticDic;
      }
      
      public function updateStaticData(param1:OpActivityStatic) : void
      {
         if(param1.kind.length > 0)
         {
            var _loc5_:int = 0;
            var _loc4_:* = param1.kind;
            for each(var _loc2_ in param1.kind)
            {
               var _loc3_:* = _loc2_;
               if(1 !== _loc3_)
               {
                  if(3 !== _loc3_)
                  {
                     if(4 !== _loc3_)
                     {
                        if(6 !== _loc3_)
                        {
                           if(7 !== _loc3_)
                           {
                              if(8 !== _loc3_)
                              {
                                 if(5 !== _loc3_)
                                 {
                                    if(9 !== _loc3_)
                                    {
                                       if(10 !== _loc3_)
                                       {
                                          if(11 !== _loc3_)
                                          {
                                             if(12 !== _loc3_)
                                             {
                                                if(13 !== _loc3_)
                                                {
                                                   if(101 !== _loc3_)
                                                   {
                                                      if(17 !== _loc3_)
                                                      {
                                                         if(15 !== _loc3_)
                                                         {
                                                            if(16 !== _loc3_)
                                                            {
                                                               if(20 !== _loc3_)
                                                               {
                                                                  if(18 !== _loc3_)
                                                                  {
                                                                     if(19 !== _loc3_)
                                                                     {
                                                                        if(29 !== _loc3_)
                                                                        {
                                                                           if(108 !== _loc3_)
                                                                           {
                                                                              if(109 !== _loc3_)
                                                                              {
                                                                                 if(110 !== _loc3_)
                                                                                 {
                                                                                    if(111 !== _loc3_)
                                                                                    {
                                                                                       if(23 !== _loc3_)
                                                                                       {
                                                                                          if(27 !== _loc3_)
                                                                                          {
                                                                                             if(24 !== _loc3_)
                                                                                             {
                                                                                                if(25 !== _loc3_)
                                                                                                {
                                                                                                   if(26 !== _loc3_)
                                                                                                   {
                                                                                                      if(22 === _loc3_)
                                                                                                      {
                                                                                                         if(param1.dbo)
                                                                                                         {
                                                                                                            _dragonBoatTimeArr = timeModelArrToOpActivityTmModelArr(param1.dbo);
                                                                                                         }
                                                                                                      }
                                                                                                   }
                                                                                                   else if(param1.dbs)
                                                                                                   {
                                                                                                      DragonBoatService.ins.shop.initShop(param1.dbs);
                                                                                                   }
                                                                                                }
                                                                                                else if(param1.dbrr)
                                                                                                {
                                                                                                   DragonBoatService.ins.stcModel.initRankScoreModle(param1.dbrr);
                                                                                                }
                                                                                             }
                                                                                             else if(param1.dbgm)
                                                                                             {
                                                                                                DragonBoatService.ins.stcModel.initGetMaterialModel(param1.dbgm);
                                                                                             }
                                                                                          }
                                                                                          else if(param1.dbm)
                                                                                          {
                                                                                             DragonBoatService.ins.stcModel.initRewardModel(param1.dbm);
                                                                                          }
                                                                                       }
                                                                                       else if(param1.dbp)
                                                                                       {
                                                                                          DragonBoatService.ins.stcModel.initPriceModel(param1.dbp);
                                                                                       }
                                                                                    }
                                                                                    else if(param1.hasQue)
                                                                                    {
                                                                                       this.parseQuestionData(param1.que);
                                                                                    }
                                                                                 }
                                                                                 else if(param1.tca)
                                                                                 {
                                                                                    if(param1.tca[0])
                                                                                    {
                                                                                       TPKCModel.ins.initOpenTime(param1.tca[0]);
                                                                                    }
                                                                                 }
                                                                              }
                                                                              else if(param1.fe)
                                                                              {
                                                                                 if(param1.fe[0])
                                                                                 {
                                                                                    GPKCModel.ins.initOpenTime(param1.fe[0]);
                                                                                 }
                                                                              }
                                                                           }
                                                                           else if(!param1.ca)
                                                                           {
                                                                           }
                                                                        }
                                                                        else if(param1.tower)
                                                                        {
                                                                           this.parseTowerData(param1.tower);
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        _fundTimeArr = fundTimeModelArrToOpActivityTmModelArr(param1.fund);
                                                                     }
                                                                  }
                                                                  else if(param1.mso)
                                                                  {
                                                                     _day51TimeArr = timeModelArrToOpActivityTmModelArr(param1.mso);
                                                                  }
                                                               }
                                                               else if(param1.mss)
                                                               {
                                                                  Day51Service.ins.shop.initShop(param1.mss);
                                                               }
                                                            }
                                                            else if(param1.msrr)
                                                            {
                                                               Day51Service.ins.initRankScoreModle(param1.msrr);
                                                            }
                                                         }
                                                         else if(param1.msri)
                                                         {
                                                            Day51Service.ins.initRewardModel(param1.msri);
                                                         }
                                                      }
                                                      else if(param1.msp)
                                                      {
                                                         Day51Service.ins.initPriceModel(param1.msp);
                                                      }
                                                   }
                                                   else if(!param1.bds)
                                                   {
                                                   }
                                                }
                                                else if(param1.lts)
                                                {
                                                   LuckTreeService.ins.initShop(param1.lts);
                                                }
                                             }
                                             else if(param1.ltsr)
                                             {
                                                LuckTreeService.ins.initPersonReward(param1.ltsr);
                                             }
                                          }
                                          else if(param1.ltwr)
                                          {
                                             LuckTreeService.ins.initWorldReward(param1.ltwr);
                                          }
                                       }
                                       else if(param1.ltr)
                                       {
                                          LuckTreeService.ins.initRewardModel(param1.ltr);
                                       }
                                    }
                                    else if(param1.ltl)
                                    {
                                       LuckTreeService.ins.initLevelModel(param1.ltl);
                                    }
                                 }
                                 else if(param1.zpc)
                                 {
                                    DialModel.ins.initCost(param1.zpc);
                                 }
                              }
                              else
                              {
                                 _zhuanpanTimeArr = zhuanpanTimeModelArrToOpActivityTmModelArr(param1.zpt);
                              }
                              continue;
                           }
                        }
                        addr62:
                        if(param1.zps)
                        {
                           DialModel.ins.initShop(param1.zps);
                        }
                        continue;
                     }
                     if(param1.zpi)
                     {
                        DialModel.ins.initItem(param1.zpi);
                     }
                     if(param1.zpr)
                     {
                        DialModel.ins.initReward(param1.zpr);
                     }
                     §§goto(addr62);
                  }
                  else
                  {
                     _tuangouTimeArr = param1.oatm;
                     continue;
                  }
               }
               else
               {
                  GrouponModel.ins.updateGrouponStaticData(param1.tg);
                  if(param1.tgr)
                  {
                     GrouponModel.ins.scoreRewardArr = param1.tgr;
                  }
                  continue;
               }
            }
         }
         else
         {
            if(param1.bds)
            {
               ShopModel.ins.initDoubleShop(param1.bds);
            }
            if(!param1.bdt)
            {
            }
            if(param1.tg)
            {
               GrouponModel.ins.updateGrouponStaticData(param1.tg);
            }
            if(param1.tgr)
            {
               GrouponModel.ins.scoreRewardArr = param1.tgr;
               GrouponModel.ins.myGrouponScore = 0;
            }
            if(param1.zpi)
            {
               DialModel.ins.initItem(param1.zpi);
            }
            if(param1.zpr)
            {
               DialModel.ins.initReward(param1.zpr);
            }
            if(param1.zps)
            {
               DialModel.ins.initShop(param1.zps);
            }
            if(param1.zpt)
            {
               _zhuanpanTimeArr = zhuanpanTimeModelArrToOpActivityTmModelArr(param1.zpt);
            }
            if(param1.zpc)
            {
               DialModel.ins.initCost(param1.zpc);
            }
            if(param1.ltl)
            {
               LuckTreeService.ins.initLevelModel(param1.ltl);
            }
            if(param1.ltr)
            {
               LuckTreeService.ins.initRewardModel(param1.ltr);
            }
            if(param1.ltwr)
            {
               LuckTreeService.ins.initWorldReward(param1.ltwr);
            }
            if(param1.ltsr)
            {
               LuckTreeService.ins.initPersonReward(param1.ltsr);
            }
            if(param1.lts)
            {
               LuckTreeService.ins.initShop(param1.lts);
            }
            if(param1.fund)
            {
               _fundTimeArr = fundTimeModelArrToOpActivityTmModelArr(param1.fund);
            }
            if(param1.msp)
            {
               Day51Service.ins.initPriceModel(param1.msp);
            }
            if(param1.msri)
            {
               Day51Service.ins.initRewardModel(param1.msri);
            }
            if(param1.msrr)
            {
               Day51Service.ins.initRankScoreModle(param1.msrr);
            }
            if(param1.mss)
            {
               Day51Service.ins.shop.initShop(param1.mss);
            }
            if(param1.mso)
            {
               _day51TimeArr = timeModelArrToOpActivityTmModelArr(param1.mso);
            }
            if(param1.ltt)
            {
               _luckTreeTimeArr = luckTreeTimeModelArrToOpActivityTmModelArr(param1.ltt);
               if(LuckTreeService.ins.isEventOpen())
               {
                  LuckTreeService.ins.server_luckTreeInfo(null);
               }
            }
            if(param1.tower)
            {
               this.parseTowerData(param1.tower);
            }
            if(param1.hasQue)
            {
               this.parseQuestionData(param1.que);
            }
            if(param1.oatm)
            {
               _tuangouTimeArr = param1.oatm;
            }
            if(!param1.ca)
            {
            }
            if(param1.fe)
            {
               if(param1.fe[0])
               {
                  GPKCModel.ins.initOpenTime(param1.fe[0]);
               }
            }
            if(param1.tca)
            {
               if(param1.tca[0])
               {
                  TPKCModel.ins.initOpenTime(param1.tca[0]);
               }
            }
            if(param1.que)
            {
               this.parseQuestionData(param1.que);
            }
            if(param1.dbp)
            {
               DragonBoatService.ins.stcModel.initPriceModel(param1.dbp);
            }
            if(param1.dbm)
            {
               DragonBoatService.ins.stcModel.initRewardModel(param1.dbm);
            }
            if(param1.dbgm)
            {
               DragonBoatService.ins.stcModel.initGetMaterialModel(param1.dbgm);
            }
            if(param1.dbrr)
            {
               DragonBoatService.ins.stcModel.initRankScoreModle(param1.dbrr);
            }
            if(param1.dbs)
            {
               DragonBoatService.ins.shop.initShop(param1.dbs);
            }
            if(param1.dbo)
            {
               _dragonBoatTimeArr = timeModelArrToOpActivityTmModelArr(param1.dbo);
            }
         }
         if(param1.ops)
         {
            this.parseOps(param1.ops);
         }
      }
      
      private function parseOps(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(!(int(_loc2_.kind) - 30))
            {
               this.parseDialData(_loc2_);
            }
         }
      }
      
      public function getGrouponStaticByKind(param1:int) : Array
      {
         var _loc2_:Array = _activityStaticDic.getValue(param1) as Array;
         return _loc2_;
      }
      
      private function zhuanpanTimeModelToOpActivityTmModel(param1:StaticZhuanPanTimeModel) : StaticOpActivityTmModel
      {
         var _loc2_:StaticOpActivityTmModel = new StaticOpActivityTmModel();
         _loc2_.startTm = param1.startTm;
         _loc2_.id = param1.id;
         _loc2_.openTm = param1.openTm;
         _loc2_.endTm = param1.endTm;
         _loc2_.version = param1.version;
         return _loc2_;
      }
      
      private function zhuanpanTimeModelArrToOpActivityTmModelArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(zhuanpanTimeModelToOpActivityTmModel(param1[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function luckTreeTimeModelArrToOpActivityTmModelArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(luckTreeTimeModelToOpActivityTmModel(param1[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function luckTreeTimeModelToOpActivityTmModel(param1:StaticLuckTreeTimeModel) : StaticOpActivityTmModel
      {
         var _loc2_:StaticOpActivityTmModel = new StaticOpActivityTmModel();
         _loc2_.startTm = param1.startTm;
         _loc2_.id = param1.id;
         _loc2_.openTm = param1.openTm;
         _loc2_.endTm = param1.endTm;
         _loc2_.version = param1.version;
         return _loc2_;
      }
      
      private function timeModelArrToOpActivityTmModelArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_.push(timeModelToOpActivityTmModel(param1[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function timeModelToOpActivityTmModel(param1:StaticMineSweepOpenModel) : StaticOpActivityTmModel
      {
         var _loc2_:* = null;
         var _loc3_:StaticOpActivityTmModel = new StaticOpActivityTmModel();
         if(param1 is StaticMineSweepOpenModel)
         {
            _loc2_ = param1 as StaticMineSweepOpenModel;
            _loc3_.startTm = RTools.getTimestamp1(_loc2_.startStamp) / 1000;
            _loc3_.id = _loc2_.id;
            _loc3_.openTm = _loc2_.openDay;
            _loc3_.endTm = RTools.getTimestamp1(_loc2_.endStamp) / 1000;
            _loc3_.version = _loc2_.version;
         }
         return _loc3_;
      }
      
      private function fundTimeModelArrToOpActivityTmModelArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            AngelFundModel.ins.onStaticChange(param1[_loc4_]);
            _loc4_++;
         }
         AngelFundService.ins.initFundInfo();
         return _loc3_;
      }
      
      public function getActivityOpenTime(param1:int) : StaticOpActivityTmModel
      {
         var _loc2_:Array = activityOpenTimeAll;
         return ArrayUtil.findByAttr(_loc2_,StaticOpActivityTmModel.ID.name,param1);
      }
      
      public function get activityOpenTimeAll() : Array
      {
         return [].concat(_zhuanpanTimeArr,_tuangouTimeArr,_luckTreeTimeArr,_fundTimeArr,this._day51TimeArr,_towerTimeArr,_crossZhuanpanTimeArr,_questionTimeArr,_dragonBoatTimeArr);
      }
      
      public function isActivityOpenTime(param1:int) : Boolean
      {
         var _loc2_:StaticOpActivityTmModel = nslm2.common.model.OpActivityStaticDataModel.ins.getActivityOpenTime(param1);
         if(_loc2_)
         {
            return ServerTimer.ins.second >= _loc2_.startTm && ServerTimer.ins.second <= _loc2_.endTm;
         }
         return false;
      }
      
      private function parseQuestionData(param1:StaticQuestionModel) : void
      {
         _questionTimeArr = [];
         var _loc2_:StaticOpActivityTmModel = new StaticOpActivityTmModel();
         _loc2_.startTm = param1.startTm;
         _loc2_.id = 111;
         _loc2_.openTm = param1.startTm;
         _loc2_.endTm = param1.endTm;
         _loc2_.version = param1.version;
         _questionTimeArr.push(_loc2_);
         QuestionModel.ins.initQuestions(param1);
      }
      
      private function parseTowerData(param1:StaticTowerModel) : void
      {
         var _loc11_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         _towerTimeArr = [];
         var _loc8_:StaticOpActivityTmModel = new StaticOpActivityTmModel();
         _loc8_.startTm = param1.st;
         _loc8_.id = TowerService.ins.timeKind_funny;
         _loc8_.openTm = param1.stt;
         _loc8_.endTm = param1.stt;
         _loc8_.version = 1;
         _towerTimeArr.push(_loc8_);
         _loc8_ = new StaticOpActivityTmModel();
         _loc8_.startTm = param1.st;
         _loc8_.id = TowerService.ins.timeKind_all;
         _loc8_.openTm = param1.et;
         _loc8_.endTm = param1.et;
         _loc8_.version = 1;
         _towerTimeArr.push(_loc8_);
         var _loc9_:Array = [];
         var _loc2_:Array = [];
         var _loc10_:Array = [];
         var _loc5_:Array = [];
         var _loc4_:Array = [];
         var _loc7_:int = param1.rows.length;
         _loc11_ = 0;
         while(_loc11_ < _loc7_)
         {
            _loc6_ = param1.rows[_loc11_];
            _loc3_ = rowKvArrToOb(_loc6_);
            var _loc12_:* = _loc3_.tbl;
            if("tower" !== _loc12_)
            {
               if("tower_cost" !== _loc12_)
               {
                  if("rank" !== _loc12_)
                  {
                     if("score" !== _loc12_)
                     {
                        if("shop" === _loc12_)
                        {
                           _loc4_.push(ProtoUtils.obToStaticLuckTreeShopModel(_loc3_));
                        }
                     }
                     else
                     {
                        _loc5_.push(ProtoUtils.obToStaticMineSweepRankRewardModel_score(_loc3_));
                     }
                  }
                  else
                  {
                     _loc10_.push(ProtoUtils.obToStaticMineSweepRankRewardModel_rank(_loc3_));
                  }
               }
               else
               {
                  _loc2_.push(new TowerStcVo_TowerCost(_loc3_));
               }
            }
            else
            {
               _loc9_.push(new TowerStcVo_Tower(_loc3_));
            }
            _loc11_++;
         }
         TowerService.ins.stcModel.initTowerModel(_loc9_);
         TowerService.ins.stcModel.initTowerCostModel(_loc2_);
         TowerService.ins.stcModel.initRankModel(_loc10_);
         TowerService.ins.stcModel.initScoreModel(_loc5_);
         if(_loc7_ > 0)
         {
            TowerService.ins.protos.server_TOWER_INFO(null);
         }
         TowerService.ins.shop.initShop(_loc4_);
      }
      
      public function parseDialData(param1:StaticOpActivity) : void
      {
         var _loc2_:* = null;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc15_:* = null;
         var _loc10_:int = 0;
         var _loc3_:int = 0;
         _loc10_ = 0;
         _loc3_ = 0;
         _crossZhuanpanTimeArr = [];
         var _loc13_:Array = [];
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         var _loc5_:Array = [];
         var _loc14_:Array = [];
         var _loc22_:int = 0;
         var _loc21_:* = param1.tables;
         for each(var _loc6_ in param1.tables)
         {
            _loc2_ = tableToObjectArr(_loc6_);
            _loc9_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc9_)
            {
               _loc11_ = _loc2_[_loc4_];
               var _loc18_:* = _loc6_.name;
               if("score" !== _loc18_)
               {
                  if("time" !== _loc18_)
                  {
                     if("table_cost" !== _loc18_)
                     {
                        if("rank" !== _loc18_)
                        {
                           if("shop" !== _loc18_)
                           {
                              if("dropbase" !== _loc18_)
                              {
                                 if("shangbangMin" !== _loc18_)
                                 {
                                    if("chaojiMin" !== _loc18_)
                                    {
                                       if("getscore" !== _loc18_)
                                       {
                                          if("getitem" === _loc18_)
                                          {
                                             _loc10_ = RTools.getTableFieldIndexByFieldName(_loc6_,"kind");
                                             _loc3_ = RTools.getTableFieldIndexByFieldName(_loc6_,"reward");
                                             if(_loc10_ >= 0 && _loc3_ >= 0)
                                             {
                                                var _loc20_:int = 0;
                                                var _loc19_:* = _loc6_.rows;
                                                for each(var _loc16_ in _loc6_.rows)
                                                {
                                                   if(_loc16_.data[_loc10_] == 0)
                                                   {
                                                      DialModel.getIns(60810).msg_0_0 = _loc16_.data[_loc3_].split(":")[2];
                                                   }
                                                   else
                                                   {
                                                      DialModel.getIns(60810).msg_1_0 = _loc16_.data[_loc3_].split(":")[2];
                                                   }
                                                }
                                             }
                                          }
                                       }
                                       else
                                       {
                                          _loc10_ = RTools.getTableFieldIndexByFieldName(_loc6_,"kind");
                                          _loc3_ = RTools.getTableFieldIndexByFieldName(_loc6_,"score");
                                          if(_loc10_ >= 0 && _loc3_ >= 0)
                                          {
                                             _loc18_ = 0;
                                             var _loc17_:* = _loc6_.rows;
                                             for each(_loc16_ in _loc6_.rows)
                                             {
                                                if(_loc16_.data[_loc10_] == 0)
                                                {
                                                   DialModel.getIns(60810).msg_0_1 = _loc16_.data[_loc3_];
                                                }
                                                else
                                                {
                                                   DialModel.getIns(60810).msg_1_1 = _loc16_.data[_loc3_];
                                                }
                                             }
                                          }
                                       }
                                    }
                                    else
                                    {
                                       DialModel.getIns(60810).chaojiMin = _loc11_.score;
                                    }
                                 }
                                 else
                                 {
                                    DialModel.getIns(60810).shangbangMin = _loc11_.score;
                                 }
                              }
                              else
                              {
                                 _loc13_.push(ProtoUtils.obToStaticZhuanPanItemModel(_loc11_));
                              }
                           }
                           else
                           {
                              _loc5_.push(ProtoUtils.obToStaticZhuanPanShopModel(_loc11_));
                           }
                        }
                        else
                        {
                           _loc8_.push(ProtoUtils.obToStaticZhuanPanRewardModel(_loc11_));
                        }
                     }
                     else if(_loc11_.count == 1)
                     {
                        DialModel.getIns(60810).costDict.put(int(_loc11_.kind) + 1,ProtoUtils.obToStaticZhuanPanCostModel(_loc11_));
                     }
                     else
                     {
                        DialModel.getIns(60810).multiCount = _loc11_.count;
                        DialModel.getIns(60810).costMultiDict.put(int(_loc11_.kind) + 1,ProtoUtils.obToStaticZhuanPanCostModel(_loc11_));
                     }
                  }
                  else
                  {
                     _crossZhuanpanTimeArr = [];
                     _loc12_ = (_loc11_.value as String).split(",");
                     _loc15_ = new StaticOpActivityTmModel();
                     _loc15_.startTm = TimeUtils.parseStringToSecond(_loc12_[0]);
                     _loc15_.id = DialConsts.timeKind_funny;
                     _loc15_.openTm = TimeUtils.parseStringToSecond(_loc12_[1]);
                     _loc15_.endTm = TimeUtils.parseStringToSecond(_loc12_[1]);
                     _loc15_.version = 1;
                     _crossZhuanpanTimeArr.push(_loc15_);
                     _loc15_ = new StaticOpActivityTmModel();
                     _loc15_.startTm = TimeUtils.parseStringToSecond(_loc12_[0]);
                     _loc15_.id = DialConsts.timeKind_all;
                     _loc15_.openTm = TimeUtils.parseStringToSecond(_loc12_[2]);
                     _loc15_.endTm = TimeUtils.parseStringToSecond(_loc12_[2]);
                     _loc15_.version = 1;
                     _crossZhuanpanTimeArr.push(_loc15_);
                  }
               }
               else
               {
                  _loc14_.push(ProtoUtils.obToStaticMineSweepRankRewardModel_score(_loc11_));
               }
               _loc4_++;
            }
         }
         DialModel.getIns(60810).initItem(_loc13_);
         DialModel.getIns(60810).initReward(_loc8_);
         DialModel.getIns(60810).initScoreModel(_loc14_);
         DialModel.getIns(60810).initShop(_loc5_);
      }
      
      private function rowKvArrToOb(param1:*) : Object
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:Object = {};
         var _loc4_:int = param1.v.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = param1.v[_loc5_];
            _loc3_[_loc2_.k] = _loc2_.v;
            _loc5_++;
         }
         return _loc3_;
      }
      
      private function tableToObjectArr(param1:Table) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:Array = [];
         var _loc6_:int = param1.fields.length;
         var _loc3_:int = param1.rows.length;
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc4_ = {};
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc4_[param1.fields[_loc5_]] = (param1.rows[_loc7_] as proto.StaticOpActivity.Table.Row).data[_loc5_];
               _loc5_++;
            }
            _loc2_.push(_loc4_);
            _loc7_++;
         }
         return _loc2_;
      }
   }
}
