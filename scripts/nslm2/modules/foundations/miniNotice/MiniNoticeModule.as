package nslm2.modules.foundations.miniNotice
{
   import game.ui.miniNotice.MiniNoticeModuleUI;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import proto.FunctionActionInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.mz.core.utils.ArrayUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class MiniNoticeModule extends MiniNoticeModuleUI
   {
       
      
      private var _nowShowedFunId:int;
      
      private var _isShowing:Boolean;
      
      private var _needShowArr:Array;
      
      private var _textCDCtrlS2:TextCDCtrlS2;
      
      public function MiniNoticeModule()
      {
         _needShowArr = [];
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.box_content.mask = this.img_mask;
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_enter !== _loc2_)
         {
            if(btn_close === _loc2_)
            {
               showOrHideContent(false);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(_nowShowedFunId);
         }
      }
      
      private function showOrHideContent(param1:Boolean) : void
      {
         this.setVisibleList("temp_miniNoticeModule",FuncOpenAutoCtrl.checkOpen(_nowShowedFunId));
         TweenLite.killDelayedCallsTo(showOrHideContent);
         TweenLite.killTweensOf(this.box_content);
         TweenLite.killDelayedCallsTo(showNoticeOnce);
         if(param1)
         {
            TweenLite.to(box_content,0.2,{
               "x":0,
               "alpha":1
            });
            TweenLite.delayedCall(10,showOrHideContent,[false]);
         }
         else
         {
            TweenLite.to(box_content,0.2,{
               "x":500,
               "alpha":0
            });
            TweenLite.delayedCall(0.2,showNoticeOnce);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.right = 100;
         this.bottom = 100;
         this.box_content.x = 500;
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.init(115002,1,"all",true);
         _loc2_.x = -9;
         _loc2_.y = -11;
         this.btn_enter.addChild(_loc2_);
         this.preShowCpl();
      }
      
      private function showFirst() : void
      {
         _needShowArr = MiniNoticeModel.ins.getFirstNeedShowArr();
         showNoticeOnce();
      }
      
      private function showNoticeOnce() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = _needShowArr.length;
         if(_loc2_ > 0)
         {
            _loc1_ = _needShowArr.shift();
            if(_loc1_.funcid == 40740 && StcMgr.ins.getFunctionVo(40740).isopen != 1)
            {
               return;
            }
            _isShowing = true;
            refresh(_loc1_);
            showOrHideContent(true);
         }
         else
         {
            _isShowing = false;
         }
      }
      
      private function refresh(param1:FunctionActionInfo) : void
      {
         _nowShowedFunId = param1.funcid;
         this.img_icon.url = UrlLib.npcFuncListIcon(_nowShowedFunId);
         switch(int(param1.status))
         {
            case 0:
               this.txt_openTime.visible = true;
               this.btn_enter.visible = false;
               this.txt_status.text = LocaleMgr.ins.getStr(999000315);
               if(_textCDCtrlS2)
               {
                  _textCDCtrlS2.dispose();
                  _textCDCtrlS2 = null;
               }
               _textCDCtrlS2 = new TextCDCtrlS2(txt_openTime,textCdFormat,textCdCpl);
               this.parts.push(new TextCDCtrlS2(txt_openTime,textCdFormat,textCdCpl));
               _textCDCtrlS2.start(param1.starttime);
               break;
            case 1:
               this.txt_openTime.visible = false;
               this.btn_enter.visible = true;
               this.txt_status.text = LocaleMgr.ins.getStr(999000316);
         }
         this.txt_funcName.text = LocaleMgr.ins.getStr(9000000 + _nowShowedFunId);
      }
      
      private function textCdFormat(param1:int) : String
      {
         return TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCdCpl() : void
      {
         this.txt_openTime.visible = false;
         this.btn_enter.visible = true;
         this.txt_status.text = LocaleMgr.ins.getStr(999000316);
         if(_textCDCtrlS2)
         {
            _textCDCtrlS2.dispose();
            _textCDCtrlS2 = null;
         }
         ArrayUtil.removeItemByAttr(_needShowArr,"funcid",_nowShowedFunId);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_FUNCTION_ACTION_CHANGED","MSG_FUNCTION_ACTION_FIRST_SHOW"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_FUNCTION_ACTION_CHANGED" !== _loc3_)
         {
            if("MSG_FUNCTION_ACTION_FIRST_SHOW" === _loc3_)
            {
               showFirst();
            }
         }
         else
         {
            _needShowArr = _needShowArr.concat(param2 as Array);
            if(_isShowing == false)
            {
               showNoticeOnce();
            }
         }
      }
      
      override public function dispose() : void
      {
         TweenLite.killDelayedCallsTo(showOrHideContent);
         TweenLite.killTweensOf(this.box_content);
         TweenLite.killDelayedCallsTo(showNoticeOnce);
         super.dispose();
      }
   }
}
