package nslm2.modules.foundations.mainToolBar
{
   import morn.customs.components.StaticModuleView;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import game.ui.mainToolBar.MainBottomIconModuleUI;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Button;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.miniTasks.model.TaskModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.event.WealthChangeEvent;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionOpenTipsVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.newerFunctionOpen.NewerFunctionOpen;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import flash.events.Event;
   import flash.geom.Point;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.utils.RTools;
   import morn.core.handlers.Handler;
   import flash.geom.Rectangle;
   import flash.display.DisplayObject;
   import nslm2.modules.cultivates.treasure.util.TreasureUtil;
   import nslm2.common.globals.GlobalRef;
   
   public class MainBottomIconModule extends StaticModuleView implements INewerGuideGetComp, INewerGuideCheckHandler
   {
       
      
      private var _backMsgArray:Array;
      
      public var ui:MainBottomIconModuleUI;
      
      public var smallBarOriX:int;
      
      public var bigBtnOriX:int;
      
      public var smallBarVerticalY:int;
      
      private var filterBreath:GlowFilterBreathCtrl;
      
      private var _newArr:Vector.<int>;
      
      private var _redPointArr:Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>;
      
      private var _alertArr:Vector.<int>;
      
      private var lastMsg:nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
      
      private var lastModuleIdArr:Array;
      
      private var lastModuleIdArrVertical:Array;
      
      private var appTimeObj:Object;
      
      public function MainBottomIconModule()
      {
         _backMsgArray = [];
         _newArr = new Vector.<int>();
         _redPointArr = new Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>();
         _alertArr = new Vector.<int>();
         lastModuleIdArr = [];
         lastModuleIdArrVertical = [];
         super();
         GlobalRef.bottomModuleBtns = this;
         this.ui = new MainBottomIconModuleUI();
         smallBarVerticalY = this.smallBarVertical.y;
         smallBarOriX = this.smallBar.x - 10;
         smallBar.x = this.width;
         bigBtnOriX = this.ui.btn_shop.x;
         ui.btn_shop.x = this.width;
         this.addChild(ui);
         this.btnShop.moduleId = 11200;
         btnBack.moduleId = 94400;
         btnBack.x = this.width;
         btnShop.addEventListener("click",btnShop_click);
         btnBack.addEventListener("click",btnBack_click);
         this.bottom = 3;
         this.right = 3;
         this.smallBar.redPointArr = this._redPointArr;
         this.smallBar.newArr = this._newArr;
         this.smallBar.alertArr = this._alertArr;
         this.smallBarVertical.redPointArr = this._redPointArr;
         this.smallBarVertical.newArr = this._newArr;
         this.expBar.refresh();
         ui.btn_recharge.addEventListener("click",onRechargeClickHandler);
         ui.btnNewFunction.addEventListener("click",onBtnNewFunctionClickHandler);
         ui.btnNewFunction.visible = PlayerModel.ins.level >= 10 && PlayerModel.ins.level < 25;
      }
      
      public function get smallBar() : BottomIconBar
      {
         return ui.smallBar as BottomIconBar;
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(NumberUtil.isNumber(param1))
         {
            return this.getIconByModuleId(int(param1)) as Component;
         }
         if(param1 == "btnBack")
         {
            if(lastMsg && lastMsg.showBackBtn == true)
            {
               return this.btnBack;
            }
            return null;
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function get btnNewFun() : Button
      {
         return ui.btnNewFunction;
      }
      
      public function get btnRecharge() : Button
      {
         return ui.btn_recharge;
      }
      
      public function get smallBarVertical() : BottomIconBarVertical
      {
         return ui.smallBarVertical as BottomIconBarVertical;
      }
      
      public function get btnShop() : BottomIconRenderBig
      {
         return ui.btn_shop as BottomIconRenderBig;
      }
      
      public function get btnBack() : BottomIconRenderBig
      {
         return ui.btn_back as BottomIconRenderBig;
      }
      
      public function get expBar() : ExpBar
      {
         return ui.expBar as ExpBar;
      }
      
      private function addNewFunctionShine() : void
      {
         if(filterBreath == null)
         {
            filterBreath = new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER).set_duration(1.2).addHandler(filterBreath_cb);
         }
      }
      
      public function removeShine() : void
      {
         if(filterBreath != null)
         {
            filterBreath.dispose();
            filterBreath = null;
         }
      }
      
      private function filterBreath_cb(param1:Array) : void
      {
         btnNewFun.filters = param1;
      }
      
      private function onBtnNewFunctionClickHandler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(96701);
      }
      
      private function onRechargeClickHandler(param1:MouseEvent) : void
      {
         if(param1.altKey && param1.ctrlKey)
         {
            VipModel.ins.showPopWin();
         }
         else
         {
            VipModel.ins.gotoCharge();
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         TaskModel.ins.updateRedPointStatus();
         showBtnFun();
      }
      
      override public function get width() : Number
      {
         return ui.width;
      }
      
      override public function get height() : Number
      {
         return ui.height;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_game_resize","wealthChange","PLAYER_LEVEL_UP","msg_main_tool_bar_id","main_tool_bar_back_add","main_tool_bar_back_delete","MSG_SWITCH_MODULE_REN_POINT","MSG_SWITCH_MODULE_NEW","MSG_SWITCH_MODULE_BUBBLE_ALERT"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         super.handleNotices(param1,param2);
         var _loc11_:* = param1;
         if("msg_game_resize" !== _loc11_)
         {
            if("MSG_SWITCH_MODULE_REN_POINT" !== _loc11_)
            {
               if("MSG_SWITCH_MODULE_NEW" !== _loc11_)
               {
                  if("wealthChange" !== _loc11_)
                  {
                     if("PLAYER_LEVEL_UP" !== _loc11_)
                     {
                        if("msg_main_tool_bar_id" !== _loc11_)
                        {
                           if("main_tool_bar_back_add" !== _loc11_)
                           {
                              if("main_tool_bar_back_delete" !== _loc11_)
                              {
                                 if("MSG_SWITCH_MODULE_BUBBLE_ALERT" === _loc11_)
                                 {
                                    _alertArr[0] = param2 as int;
                                    this.smallBar.validateAlert();
                                 }
                              }
                              else
                              {
                                 _loc6_ = param2 as MainToolBarBackMsg;
                                 _loc9_ = _backMsgArray.length - 1;
                                 while(_loc9_ >= 0)
                                 {
                                    if(_backMsgArray[_loc9_].moduleId == _loc6_.moduleId)
                                    {
                                       _backMsgArray.splice(_loc9_,1);
                                    }
                                    _loc9_--;
                                 }
                              }
                           }
                           else
                           {
                              _loc3_ = param2 as MainToolBarBackMsg;
                              _backMsgArray.push(_loc3_);
                           }
                        }
                        else
                        {
                           _loc8_ = param2 as nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
                           TweenLite.killDelayedCallsTo(delayShow);
                           TweenLite.delayedCall(0.1,delayShow,[_loc8_]);
                        }
                     }
                     else
                     {
                        if(lastMsg)
                        {
                           TweenLite.killDelayedCallsTo(delayShow);
                           TweenLite.delayedCall(0.1,delayShow,[lastMsg]);
                        }
                        showBtnFun(true);
                     }
                  }
                  else
                  {
                     _loc4_ = param2 as WealthChangeEvent;
                     if(_loc4_.wealthType == 1010 || _loc4_.wealthType == 10)
                     {
                        this.expBar.refresh();
                     }
                  }
               }
               else
               {
                  _loc7_ = param2 as SwitchModuleNewMsg;
                  if(_loc7_.vis)
                  {
                     if(_newArr.indexOf(_loc7_.moduleId) == -1)
                     {
                        _newArr.push(_loc7_.moduleId);
                     }
                  }
                  else
                  {
                     ArrayUtil.removeItem(_newArr,_loc7_.moduleId);
                  }
                  this.smallBar.validateRedPoint();
                  this.smallBarVertical.validateRedPoint();
                  this.smallBar.validateAlert();
               }
            }
            else
            {
               _loc5_ = param2 as SwitchModuleRedPointMsg;
               if(_loc5_.vis)
               {
                  _loc10_ = ArrayUtil.findByAttr(_redPointArr,"moduleID",_loc5_.moduleId);
                  if(!_loc10_)
                  {
                     _loc10_ = new nslm2.modules.foundations.mainToolBar.RedPointVo(_loc5_.moduleId,_loc5_.count);
                     _redPointArr.push(_loc10_);
                  }
                  _loc10_.count = _loc5_.count;
               }
               else
               {
                  ArrayUtil.removeItemByAttr(_redPointArr,"moduleID",_loc5_.moduleId);
               }
               this.smallBar.validateRedPoint();
               this.smallBarVertical.validateRedPoint();
               this.smallBar.validateAlert();
            }
         }
         else
         {
            onResize(null);
         }
      }
      
      private function showBtnFun(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         if(btnRecharge.visible)
         {
            _loc3_ = 0;
            _loc4_ = 100;
            _loc2_ = StcMgr.ins.getFunctionOpenTipsTable();
            var _loc7_:int = 0;
            var _loc6_:* = _loc2_.array;
            for each(_loc5_ in _loc2_.array)
            {
               _loc3_ = Math.max(_loc5_.functionOpenLv,_loc3_);
               _loc4_ = Math.min(_loc5_.tipsOpenLv,_loc4_);
            }
            if(PlayerModel.ins.level >= _loc4_ && PlayerModel.ins.level < _loc3_)
            {
               btnNewFun.visible = true && btnRecharge.visible;
               if(!param1)
               {
                  if(!ModuleMgr.ins.isShow(96701) && !NewerFunctionOpen.userClose)
                  {
                     ModuleMgr.ins.showModule(96701);
                  }
               }
               else
               {
                  var _loc9_:int = 0;
                  var _loc8_:* = _loc2_.array;
                  for each(_loc5_ in _loc2_.array)
                  {
                     if(_loc5_.tipsOpenLv == PlayerModel.ins.level)
                     {
                        NewerFunctionOpen.userClose = false;
                        ModuleMgr.ins.showModule(96701);
                     }
                  }
               }
            }
            else
            {
               ModuleMgr.ins.closeModule(96701);
               btnNewFun.visible = false;
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(96701);
            btnNewFun.visible = false;
         }
      }
      
      private function delayShow(param1:nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg) : void
      {
         $msg = param1;
         if(EnvConfig.ins.hideForBS)
         {
            $msg.showShopBtn = false;
            ArrayUtil.removeItem($msg.moduleIdArr,11500);
            ArrayUtil.removeItem($msg.moduleIdArr,30300);
            ArrayUtil.removeItem($msg.moduleIdArrVertical,40700);
            ArrayUtil.removeItem($msg.moduleIdArrVertical,41210);
         }
         var $moduleIdArr:Array = $msg.moduleIdArr.filter(function(param1:int, ... rest):Boolean
         {
            return FuncOpenAutoCtrl.checkOpen(param1);
         });
         var $moduleIdArrVertical:Array = $msg.moduleIdArrVertical.filter(function(param1:int, ... rest):Boolean
         {
            return FuncOpenAutoCtrl.checkOpen(param1);
         });
         if(lastMsg && ArrayUtil.compareArrIsSame(lastModuleIdArr,$moduleIdArr) && ArrayUtil.compareArrIsSame(lastModuleIdArrVertical,$moduleIdArrVertical) && lastMsg.showBackBtn == $msg.showBackBtn && lastMsg.showShopBtn == $msg.showShopBtn)
         {
            return;
         }
         var $useFade:Boolean = false;
         var BASIC_SHOP_X:int = 590;
         if($msg.showBackBtn)
         {
            var $smallBarAimX:int = smallBarOriX;
            TweenLite.to(smallBar,!!$useFade?0.3:0,{"x":$smallBarAimX});
            TweenLite.to(this.btnBack,!!$useFade?0.3:0,{
               "delay":0.4,
               "x":bigBtnOriX
            });
            TweenLite.to(smallBarVertical,!!$useFade?0.3:0,{
               "y":smallBarVerticalY,
               "x":$smallBarAimX
            });
            TweenLite.to(btnShop,!!$useFade?0.3:0,{"x":this.width + BASIC_SHOP_X});
            btnShop.hide();
            btnRecharge.visible = false;
            showBtnFun();
         }
         else
         {
            TweenLite.to(this.btnBack,!!$useFade?0.3:0,{"x":this.width + 600});
            if($msg.showShopBtn)
            {
               $smallBarAimX = smallBarOriX;
               TweenLite.to(smallBar,!!$useFade?0.3:0,{"x":$smallBarAimX - 40});
               TweenLite.to(smallBarVertical,!!$useFade?0.3:0,{
                  "y":smallBarVerticalY - 25,
                  "x":$smallBarAimX - 10
               });
               TweenLite.to(btnShop,!!$useFade?0.3:0,{"x":bigBtnOriX - 20});
               btnShop.show();
               btnRecharge.visible = true;
               showBtnFun();
            }
            else
            {
               $smallBarAimX = this.width;
               TweenLite.to(smallBar,!!$useFade?0.3:0,{"x":$smallBarAimX});
               TweenLite.to(smallBarVertical,!!$useFade?0.3:0,{
                  "y":smallBarVerticalY,
                  "x":$smallBarAimX
               });
               TweenLite.to(btnShop,!!$useFade?0.3:0,{"x":this.width + BASIC_SHOP_X});
               btnShop.hide();
               btnRecharge.visible = false;
               showBtnFun();
            }
         }
         this.smallBar.useFade = $useFade;
         this.smallBar.moduleIdArr = $moduleIdArr;
         this.smallBar.validateAlert();
         this.smallBarVertical.useFade = $useFade;
         this.smallBarVertical.moduleIdArr = $moduleIdArrVertical;
         NGUtil.checkModuleHide(this.moduleId);
         if($moduleIdArr.length == 0)
         {
            expBar.tweenW(0,0);
         }
         else
         {
            expBar.tweenW($smallBarAimX + $moduleIdArr.length * BottomIconRender.WW,this.width);
         }
         lastMsg = $msg;
         lastModuleIdArr = $moduleIdArr;
         lastModuleIdArrVertical = $moduleIdArrVertical;
         if($useFade)
         {
            TweenLite.delayedCall(0.2 + 0.1 * (2 + Math.max($moduleIdArr.length,$moduleIdArrVertical.length)),NG_checkModuleShow);
         }
         else
         {
            NG_checkModuleShow();
         }
         onResize(null);
      }
      
      override protected function onResize(param1:Event) : void
      {
         e = param1;
         resize = function():void
         {
            var _loc2_:Point = new Point(0,0);
            _loc2_.x = (UIMgr.stage.stageWidth - ui.btn_recharge.width) * 0.5;
            _loc2_ = ui.globalToLocal(_loc2_);
            var _loc1_:int = RTools.cl(-720,-570);
            if(_loc2_.x > _loc1_)
            {
               ui.btn_recharge.x = _loc1_;
            }
            else
            {
               ui.btn_recharge.x = _loc2_.x;
            }
            ui.btnNewFunction.x = ui.btn_recharge.x + (ui.btn_recharge.width - ui.btnNewFunction.width) / 2;
         };
         super.onResize(e);
         resize();
         !!appTimeObj?App.timer.clearTimer(appTimeObj):0;
         appTimeObj = App.timer.doOnce(10,resize);
      }
      
      private function NG_checkModuleShow() : void
      {
         NGUtil.checkModuleShow(this.moduleId,this,false);
      }
      
      private function btnShop_click(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(11200);
      }
      
      private function btnBack_click(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _backMsgArray.length - 1;
         while(_loc2_ >= 0)
         {
            if(_backMsgArray[_loc2_].moduleId == ModuleMgr.ins.sceneLayer.curModuleId)
            {
               Handler.execute(_backMsgArray[_loc2_].fun,_backMsgArray[_loc2_].param);
               return;
            }
            _loc2_--;
         }
         ModuleMgr.ins.closeModule(ModuleMgr.ins.sceneLayer.curModuleId);
      }
      
      override protected function hitHole3D(param1:Rectangle) : Boolean
      {
         var _loc5_:Point = this.parent.globalToLocal(new Point(param1.x,param1.y));
         var _loc4_:Rectangle = new Rectangle(_loc5_.x,_loc5_.y,param1.width,param1.height);
         var _loc3_:Rectangle = this.smallBar.getRect(this.parent);
         var _loc2_:Rectangle = this.smallBarVertical.getRect(this.parent);
         return _loc4_.intersects(_loc3_) || _loc4_.intersects(_loc2_);
      }
      
      public function get flyToIcon() : DisplayObject
      {
         var _loc1_:DisplayObject = this.bagIcon;
         if(_loc1_)
         {
            return _loc1_;
         }
         return this.teamIcon;
      }
      
      private function get bagIcon() : DisplayObject
      {
         return getIconByModuleId(11000);
      }
      
      private function get teamIcon() : DisplayObject
      {
         return getIconByModuleId(30810);
      }
      
      public function get heroIcon() : DisplayObject
      {
         return getIconByModuleId(30701);
      }
      
      public function get guajiRewardBag() : DisplayObject
      {
         return getIconByModuleId(41212);
      }
      
      public function getIconByModuleId(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = this.smallBar.btnSmallLib[param1];
         if(_loc2_ == null)
         {
            _loc2_ = this.smallBarVertical.btnSmallLib[param1];
         }
         return _loc2_;
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 99900))
         {
            if(TreasureUtil.checkCanRuneNg(true,true) == false)
            {
               return 0;
            }
         }
         return 1;
      }
   }
}
