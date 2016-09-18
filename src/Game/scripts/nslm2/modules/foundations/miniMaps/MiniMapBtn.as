package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.MiniMapBtnUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.configs.StcLanguageConfig;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import morn.core.components.Label;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS3;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleEffMsg;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleTimerMsg;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.mediators.RollMediator;
   
   public class MiniMapBtn extends MiniMapBtnUI implements IObserver
   {
       
      
      private var _eff:BmcSpriteSheet;
      
      private var _funcId:int;
      
      private var _redPoint:RedPoint;
      
      private var _timerLabel:Label;
      
      private var _textCDCtrlS3:TextCDCtrlS3;
      
      private var _textCDCtrlS2:TextCDCtrlS2;
      
      public function MiniMapBtn()
      {
         super();
         this.img_icon.mouseEvent = false;
         this.btn_bg.mouseEvent = false;
         this.btn_bg.visible = false;
         this.buttonMode = true;
         this.parts.push(new RollMediator(this,onRoll));
         ObserverMgr.ins.regObserver(this);
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            this.img_icon.filters = [FilterLib.BUTTON_OVER_STATE_20];
         }
         else
         {
            this.img_icon.filters = [];
         }
      }
      
      public function get funcId() : int
      {
         return _funcId;
      }
      
      public function set funcId(param1:int) : void
      {
         var _loc2_:int = 0;
         if(_funcId != param1)
         {
            _funcId = param1;
            _loc2_ = 9700000 + this._funcId;
            if(LocaleMgr.ins.hasStr(_loc2_) == false)
            {
               _loc2_ = 9000000 + this._funcId;
            }
            if(param1 == 900200)
            {
               this.img_icon.url = UrlLib.mainToolBarIconSmall(ClientConfig.language);
               this.toolTip = LocaleMgr.ins.getStr(_loc2_,[StcLanguageConfig.ins.getLanguage(App.languageCodeIdAry[App.languageAry.indexOf(App.language)])]);
            }
            else
            {
               this.img_icon.url = UrlLib.mainToolBarIconSmall(_funcId.toString());
               this.toolTip = LocaleMgr.ins.getStr(_loc2_);
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT","MSG_SWITCH_MINIMAP_EFFECT_VISIBLE","msgSwitchMinimapCountDown"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" !== _loc6_)
         {
            if("MSG_SWITCH_MINIMAP_EFFECT_VISIBLE" !== _loc6_)
            {
               if("msgSwitchMinimapCountDown" === _loc6_)
               {
                  _loc4_ = param2 as SwitchModuleTimerMsg;
                  if(_loc4_.moduleId == this.funcId)
                  {
                     if(_loc4_.endStamp != 0)
                     {
                        if(_timerLabel == null)
                        {
                           _timerLabel = new Label();
                           _timerLabel.style = "不足禁止红";
                           _timerLabel.x = -5;
                           _timerLabel.y = 20;
                        }
                        this.addChild(_timerLabel);
                        if(_loc4_.startStamp != 0)
                        {
                           if(_textCDCtrlS3 == null)
                           {
                              _textCDCtrlS3 = new TextCDCtrlS3(_timerLabel,textCdFormat,textCdCpl);
                              this.parts.push(new TextCDCtrlS3(_timerLabel,textCdFormat,textCdCpl));
                           }
                           if(_textCDCtrlS2)
                           {
                              _textCDCtrlS2.dispose();
                              _textCDCtrlS2 = null;
                           }
                           _textCDCtrlS3.start(_loc4_.startStamp,_loc4_.endStamp);
                        }
                        else
                        {
                           if(_textCDCtrlS2 == null)
                           {
                              _textCDCtrlS2 = new TextCDCtrlS2(_timerLabel,textCdFormat,textCdCpl);
                              this.parts.push(new TextCDCtrlS2(_timerLabel,textCdFormat,textCdCpl));
                           }
                           if(_textCDCtrlS3)
                           {
                              _textCDCtrlS3.dispose();
                              _textCDCtrlS3 = null;
                           }
                           _textCDCtrlS2.start(_loc4_.endStamp);
                        }
                     }
                     else
                     {
                        if(_timerLabel)
                        {
                           _timerLabel.dispose();
                           _timerLabel = null;
                        }
                        if(_textCDCtrlS2)
                        {
                           _textCDCtrlS2.dispose();
                           _textCDCtrlS2 = null;
                        }
                        if(_textCDCtrlS3)
                        {
                           _textCDCtrlS3.dispose();
                           _textCDCtrlS3 = null;
                        }
                     }
                  }
               }
            }
            else
            {
               _loc3_ = param2 as SwitchModuleEffMsg;
               if(_loc3_.moduleId == this.funcId)
               {
                  if(_loc3_.vis)
                  {
                     if(_eff == null)
                     {
                        _eff = new BmcSpriteSheet();
                        _eff.x = -19;
                        _eff.y = -18;
                        _eff.init(115003,1,"all",true);
                        this.addChildAt(_eff,0);
                     }
                  }
                  else if(_eff)
                  {
                     _eff.dispose();
                     _eff = null;
                  }
               }
            }
         }
         else
         {
            _loc5_ = param2 as SwitchModuleRedPointMsg;
            if(_loc5_.moduleId == this.funcId)
            {
               if(_loc5_.vis)
               {
                  if(_redPoint == null)
                  {
                     _redPoint = new RedPoint();
                  }
                  _redPoint.top = -2;
                  _redPoint.right = -2;
                  this.addChild(_redPoint);
               }
               else if(_redPoint)
               {
                  _redPoint.dispose();
                  _redPoint = null;
               }
            }
         }
      }
      
      private function textCdFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCdCpl() : void
      {
         if(_timerLabel)
         {
            _timerLabel.dispose();
            _timerLabel = null;
         }
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         if(_textCDCtrlS3)
         {
            _textCDCtrlS3.dispose();
            _textCDCtrlS3 = null;
         }
      }
      
      override public function dispose() : void
      {
         if(_redPoint)
         {
            _redPoint.dispose();
            _redPoint = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
