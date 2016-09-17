package nslm2.modules.funnies.newYears.luckTrees.panels
{
   import game.ui.newYears.luckTrees.panels.PersonTreePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Component;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.HorseLampVMultiLine;
   import nslm2.common.ui.components.comps2d.others.CommonBuyConfirm;
   import flash.events.MouseEvent;
   import proto.StaticLuckTreeShopModel;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.vo.CommonBuyVo;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.LuckTreeDajiangRecord;
   import com.mz.core.event.MzEvent;
   import proto.StaticLuckTreeRewardModel;
   import nslm2.common.vo.WealthVo;
   import game.ui.newYears.luckTrees.panels.personTreeIcons.PersonTreeIcon1UI;
   import com.greensock.TweenLite;
   import com.mz.core.logging.Log;
   import morn.core.components.Button;
   import game.ui.commons.icons.LotteryRenderS9UI;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import morn.core.handlers.Handler;
   import proto.LuckTreeCheerRes;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   
   public class PersonTreePanel extends PersonTreePanelUI implements IViewStackPage, IObserver
   {
       
      
      private var cdCtrl:TextCDCtrlS2;
      
      public var shineStartX:int;
      
      public var shineEndX:int;
      
      private var sparkEff:BmcSpriteSheet;
      
      public var treeIconsPanel:Component;
      
      public var treeIcons:Vector.<WealthRender>;
      
      private var horseLamp:HorseLampVMultiLine;
      
      private var bagMed:nslm2.modules.funnies.newYears.luckTrees.panels.PersonTreeBagMediator;
      
      private var _commonBuyConfirm:CommonBuyConfirm;
      
      private var tempLv:int;
      
      private var oriY:Array;
      
      public function PersonTreePanel()
      {
         oriY = [];
         super();
         var _loc2_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(10);
         this.cdCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,textCDCpl);
         this.cdCtrl.start(_loc2_.endTm);
         shineStartX = this.img_progressShine.x;
         shineEndX = this.img_progressShine.x + 312;
         sparkEff = new BmcSpriteSheet();
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.setAnchor(0.5,0.5);
         _loc3_.init(60000003,1,"all",true);
         DisplayUtils.addChildAbove(_loc3_,this.img_progressShine);
         sparkEff.y = this.img_progressShine.y + 62;
         this.img_progressShine.visible = false;
         this.txt_tree_lv_label.text = LocaleMgr.ins.getStr(13350001);
         this.txt_cd_lab.text = LocaleMgr.ins.getStr(13350003);
         this.txt_tip1.text = LocaleMgr.ins.getStr(13350010);
         this.btn_do1.label = LocaleMgr.ins.getStr(13350005);
         this.btn_do10.label = LocaleMgr.ins.getStr(13350006);
         this.btn_do50.label = LocaleMgr.ins.getStr(13350026);
         this.btn_order.label = LocaleMgr.ins.getStr(10000028);
         this.txt_title_affiche.text = LocaleMgr.ins.getStr(9010130);
         this.txt_bagName.text = LocaleMgr.ins.getStr(13350025);
         horseLamp = new HorseLampVMultiLine("left");
         horseLamp.needCycling = true;
         this.txt_prompt_place.replaceWith(horseLamp);
         bagMed = new nslm2.modules.funnies.newYears.luckTrees.panels.PersonTreeBagMediator(this);
         this.parts.push(bagMed);
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         txt_to_world_tree.addEventListener("click",txt_to_world_tree_click);
         txt_to_world_tree.text = TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(13350002),LinkUtils.evtString(0),16046112);
         txt_returnCurLv.addEventListener("click",txt_returnCurLv_click);
         txt_returnCurLv.text = TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(13350004),LinkUtils.evtString(0),16046112);
         this.btnBuyItem.visible = LuckTreeService.ins.spShopItem != null;
         this.btnBuyItem.addEventListener("click",onBtnBuyClick);
         var _loc5_:StcLotteryVo = new StcLotteryVo();
         _loc5_.spare_cost_res = DefindConsts.SHU_NOR_COST_ITEM;
         _loc5_.cost_res = DefindConsts.SHU_NOR_COST_DIAMOND;
         var _loc4_:StcLotteryVo = new StcLotteryVo();
         _loc4_.spare_cost_res = DefindConsts.SHU_SUP_COST_ITEM;
         _loc4_.cost_res = DefindConsts.SHU_SUP_COST_DIAMOND;
         var _loc1_:StcLotteryVo = new StcLotteryVo();
         _loc1_.spare_cost_res = DefindConsts.SHU_SUP_COST_ITEM50;
         _loc1_.cost_res = DefindConsts.SHU_SUP_COST_DIAMOND50;
         this.costRender1.lotteryVo = _loc5_;
         this.costRender10.lotteryVo = _loc4_;
         this.costRender50.lotteryVo = _loc1_;
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_YELLOW).addHandler(breath_cb));
         initHorseLamp();
      }
      
      protected function onBtnBuyClick(param1:MouseEvent) : void
      {
         event = param1;
         buyItem = function():void
         {
            LuckTreeService.ins.server_luckTreeBuy(vo.id,_commonBuyConfirm.numBar.nowNum);
         };
         var vo:StaticLuckTreeShopModel = LuckTreeService.ins.spShopItem;
         _commonBuyConfirm = new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),LuckTreeService.ins.getSpItemResBuyCount()));
         AlertUtil.comfirm(new CommonBuyConfirm(new CommonBuyVo(WealthUtil.parseCostStr(vo.cost),WealthUtil.parseCostStr(vo.item),LuckTreeService.ins.getSpItemResBuyCount())),buyItem);
         var resCount:int = LuckTreeService.ins.getSpItemResBuyCount(false);
         var countTxt:String = resCount.toString() + "/" + LuckTreeService.ins.getSpItemMaxBuyCount();
         countTxt = TextFieldUtil.htmlText2(countTxt,458496);
         _commonBuyConfirm.setAlertTxt(LocaleMgr.ins.getStr(13350029,[PlayerModel.ins.vip,countTxt]));
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.img_tree_bg.filters = param1;
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TimeUtils.hisCNWithDay(param1);
      }
      
      private function textCDCpl() : void
      {
         this.txt_cd.text = LocaleMgr.ins.getStr(10000024);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_TIME_OVER",10);
      }
      
      private function txt_to_world_tree_click(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TAB_TO_WORLD_TREE");
      }
      
      private function txt_returnCurLv_click(param1:MouseEvent = null) : void
      {
         this.bagMed.stop();
         this.refreshTree(this.service.infoRes.member.curlevel,true);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         this.horseLamp.resume();
         this.service.addEventListener("MSG_NEW_BIG_REWARD",onNewBigReward);
         this.bagMed.addEventListener("EVT_FLY_CPL_ALL",flyCplAll);
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.horseLamp.pause();
         this.service.removeEventListener("MSG_NEW_BIG_REWARD",onNewBigReward);
         this.bagMed.removeEventListener("EVT_FLY_CPL_ALL",flyCplAll);
         this.bagMed.stop();
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc5_)
         {
            _loc3_ = param2 as int;
            _loc4_ = LuckTreeService.funcIdArr.indexOf(_loc3_);
            if(_loc4_ == 0)
            {
               updateRedPoi();
            }
         }
      }
      
      private function updateRedPoi() : void
      {
         redPoi1.visible = costRender1.isShowSpareCost();
         redPoi10.visible = costRender10.isShowSpareCost();
         redPoi50.visible = costRender50.isShowSpareCost() && this.btn_do50.visible;
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      private function refreshUI() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:String = img_icon_tree.skin;
         img_icon_tree.skin = _loc2_.substr(0,_loc2_.length - 1) + Math.floor(this.service.infoRes.member.curlevel / 3);
         if(this.service.infoRes.member.curlevel >= this.service.getPersonTreeLevelMax())
         {
            this.progressBar.value = 1;
            this.img_progressShine.x = this.shineStartX + (this.shineEndX - this.shineStartX);
            this.txt_val.text = "";
         }
         else
         {
            _loc1_ = this.service.infoRes.member.curexp / this.service.getLevelModelByLv(this.service.infoRes.member.curlevel).exp;
            this.progressBar.value = _loc1_;
            this.img_progressShine.x = this.shineStartX + (this.shineEndX - this.shineStartX) * _loc1_;
            this.txt_val.text = this.service.infoRes.member.curexp + "/" + this.service.getLevelModelByLv(this.service.infoRes.member.curlevel).exp;
         }
         if(this.service.infoRes.member.curlevel >= 4)
         {
            this.btn_do50.visible = true;
            this.costRender50.visible = true;
            this.box_btns.x = 71;
            this.box_score.x = this.btn_do50.x + 126;
         }
         else
         {
            this.btn_do50.visible = false;
            this.costRender50.visible = false;
            this.box_btns.x = 161;
            this.box_score.x = this.btn_do10.x + 126;
         }
         sparkEff.x = this.img_progressShine.x + 37;
         this.txt_tree_lv.text = "Lv." + this.service.infoRes.member.curlevel;
         this.txt_score.text = LocaleMgr.ins.getStr(13350007) + ":" + this.service.infoRes.member.score;
         this.render_cost.wealthVo = WealthUtil.createCountItemVo(83210);
         this.refreshTree(this.service.infoRes.member.curlevel);
         updateRedPoi();
      }
      
      private function initHorseLamp() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc5_:Array = this.service.daJiangRecords;
         if(_loc5_)
         {
            _loc3_ = [];
            _loc2_ = _loc5_;
            _loc6_ = _loc2_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc1_ = _loc2_[_loc7_];
               _loc4_ = parseHorseInfo(_loc1_);
               if(_loc4_)
               {
                  _loc3_.push(_loc4_);
               }
               _loc7_++;
            }
            horseLamp.clear();
            horseLamp.init(Math.min(4,_loc6_));
            horseLamp.show(_loc3_);
         }
      }
      
      private function onNewBigReward(param1:MzEvent) : void
      {
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:Array = param1.data as Array;
         var _loc5_:int = _loc3_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = _loc3_[_loc6_];
            _loc4_ = parseHorseInfo(_loc2_);
            if(_loc4_)
            {
               this.horseLamp.add(_loc4_);
            }
            _loc6_++;
         }
      }
      
      private function parseHorseInfo(param1:LuckTreeDajiangRecord) : String
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         switch(int(param1.kind) - 1)
         {
            case 0:
               _loc3_ = this.service.getRewardById(param1.itemid);
               if(_loc3_)
               {
                  _loc2_ = WealthUtil.parseCostStr(_loc3_.item);
                  if(_loc2_ && _loc2_.kind == 20)
                  {
                     return LocaleMgr.ins.getStr(13323023,[param1.baseinfo,_loc2_.sid]);
                  }
               }
            case 1:
            case 2:
               return LocaleMgr.ins.getStr(13323024,[param1.level]);
         }
      }
      
      private function refreshTree(param1:int, param2:Boolean = false) : void
      {
         if(param1 == tempLv)
         {
            return;
         }
         tempLv = param1;
         this.txt_show_lv.text = "Lv." + param1;
         if(param1 != this.service.infoRes.member.curlevel)
         {
            this.txt_returnCurLv.visible = true;
         }
         else
         {
            this.txt_returnCurLv.visible = false;
         }
         if(param1 == 1)
         {
            this.btn_preLv.disabled = true;
            this.btn_nextLv.disabled = false;
         }
         else if(param1 >= this.service.getPersonTreeLevelMax())
         {
            this.btn_preLv.disabled = false;
            this.btn_nextLv.disabled = true;
         }
         else
         {
            this.btn_preLv.disabled = false;
            this.btn_nextLv.disabled = false;
         }
         this.box_btns.visible = param1 == this.service.infoRes.member.curlevel;
         if(treeIconsPanel)
         {
            treeIconsPanel.dispose();
         }
         treeIconsPanel = new PersonTreeIcon1UI();
         this.addChild(treeIconsPanel);
         this.treeIconsPanel.x = this.img_tree.x;
         this.treeIconsPanel.y = this.img_tree.y;
         treeIcons = new Vector.<WealthRender>();
         showAllIcons(param1,param2);
      }
      
      public function showAllIcons(param1:int = -1, param2:Boolean = false) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         if(param1 == -1)
         {
            param1 = this.service.infoRes.member.curlevel;
         }
         _loc7_ = 1;
         while(_loc7_ <= 12)
         {
            if(this.treeIconsPanel.hasOwnProperty("render" + _loc7_))
            {
               _loc6_ = this.treeIconsPanel["render" + _loc7_];
               _loc6_.visible = false;
               if(oriY.length < _loc7_)
               {
                  oriY[_loc7_ - 1] = _loc6_.y;
               }
            }
            _loc7_++;
         }
         var _loc3_:Array = this.service.getRewardArrByLv(param1);
         var _loc5_:int = _loc3_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = _loc3_[_loc7_];
            if(this.treeIconsPanel.hasOwnProperty("render" + _loc4_.position))
            {
               _loc6_ = this.treeIconsPanel["render" + _loc4_.position];
               _loc6_.visible = true;
               _loc6_.wealthVo = WealthUtil.parseCostStr(_loc4_.item);
               _loc6_.wealthVo.extraData = _loc4_;
               treeIcons.push(_loc6_);
               if(param2)
               {
                  _loc6_.y = oriY[int(_loc4_.position) - 1] - 15;
                  _loc6_.alpha = 0;
                  TweenLite.to(_loc6_,0.3,{
                     "alpha":1,
                     "y":oriY[int(_loc4_.position) - 1],
                     "delay":0.2 * Math.random()
                  });
               }
               else
               {
                  _loc6_.alpha = 1;
               }
               _loc7_++;
               continue;
            }
            Log.error(this,"错误的position ",_loc4_);
            break;
         }
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:* = param1;
         if(this.btn_preLv !== _loc8_)
         {
            if(this.btn_nextLv !== _loc8_)
            {
               if(this.btn_order !== _loc8_)
               {
                  if(this.btn_do1 !== _loc8_)
                  {
                     if(this.btn_do10 !== _loc8_)
                     {
                        if(this.btn_do50 === _loc8_)
                        {
                           _loc5_ = 3;
                           _loc4_ = costRender50;
                           _loc6_ = 50;
                        }
                     }
                     else
                     {
                        _loc5_ = 2;
                        _loc4_ = costRender10;
                        _loc6_ = 10;
                     }
                  }
                  else
                  {
                     _loc5_ = 1;
                     _loc4_ = costRender1;
                     _loc6_ = 1;
                  }
               }
               else
               {
                  bagMed.stop();
                  bagMed.order();
               }
            }
            else
            {
               this.bagMed.stop();
               refreshTree(tempLv + 1,true);
            }
         }
         else
         {
            this.bagMed.stop();
            refreshTree(tempLv - 1,true);
         }
         if(_loc5_ != 0)
         {
            _loc7_ = _loc4_.lotteryVo;
            _loc3_ = WealthUtil.parseCostStr(_loc7_.spare_cost_res);
            if(PlayerModel.ins.getCountByWealthVo(_loc3_) >= _loc3_.count)
            {
               service.server_luckTreeCheer(_loc5_,server_luckTreeCheer_cpl);
            }
            else
            {
               _loc3_ = WealthUtil.parseCostStr(_loc7_.cost_res);
               AlertUtil.comfirm(LocaleMgr.ins.getStr(13350030,[_loc6_,_loc3_.count]),new Handler(service.server_luckTreeCheer,[_loc5_,server_luckTreeCheer_cpl]),null,"13350");
            }
         }
      }
      
      private function server_luckTreeCheer_cpl(param1:LuckTreeCheerRes) : void
      {
         var _loc2_:* = undefined;
         this.refreshUI();
         this.refreshTree(this.service.getRewardById(param1.itemids[0]).level);
         _loc2_ = findRenderArr(param1.itemids);
         if(_loc2_)
         {
            bagMed.addNewVoArr(_loc2_);
         }
         this.refreshTree(this.service.infoRes.member.curlevel);
      }
      
      private function findRenderArr(param1:Array) : Vector.<WealthRender>
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Vector.<WealthRender> = new Vector.<WealthRender>();
         var _loc3_:int = param1.length;
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = param1[_loc6_];
            _loc5_ = findIconById(_loc4_);
            if(_loc5_)
            {
               _loc2_.push(_loc5_);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      private function findIconById(param1:int) : WealthRender
      {
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = this.treeIcons.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.treeIcons[_loc5_];
            if(_loc2_.wealthVo)
            {
               _loc3_ = _loc2_.wealthVo.extraData as StaticLuckTreeRewardModel;
               if(_loc3_.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      private function flyCplAll(... rest) : void
      {
         this.txt_returnCurLv_click(null);
      }
      
      override public function dispose() : void
      {
         this.service.removeEventListener("MSG_NEW_BIG_REWARD",onNewBigReward);
         super.dispose();
      }
   }
}
