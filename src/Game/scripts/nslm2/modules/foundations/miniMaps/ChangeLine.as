package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.ChangeLineUI;
   import com.mz.core.event.MzEvent;
   import proto.ShowLineStateRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.ShowLineStateRes.LineState;
   import morn.customs.FilterLib;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import nslm2.modules.scenes.commons.SceneModel;
   import com.mz.core.mediators.RollMediator;
   import com.mz.core.mgrs.UIMgr;
   
   public class ChangeLine extends ChangeLineUI
   {
       
      
      private var curLine:int;
      
      private var lineState:Array;
      
      private var isFolderOut:Boolean;
      
      public function ChangeLine()
      {
         super();
         this.parts.push(new RollMediator(this.boxCurLine,curLine_onRoll));
         this.addEventListener("click",this_onClick);
         this.txt_line.text = "";
         this.list_line.array = [];
         list_line.changeHandler = list_changeHandler;
         this.buttonMode = false;
         this.btn_arrowDown.visible = false;
         this.img_listBg.visible = false;
         this.list_line.visible = false;
         UIMgr.stage.addEventListener("click",stage_onClick);
         SceneModel.ins.addEventListener("msg_show_line_state",se_showLineState);
         showLineState(SceneModel.ins.showLineStateRes);
      }
      
      private function se_showLineState(param1:MzEvent) : void
      {
         var _loc2_:ShowLineStateRes = param1.data as ShowLineStateRes;
         showLineState(_loc2_);
      }
      
      private function showLineState(param1:ShowLineStateRes) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.curLine = param1.line;
         this.lineState = param1.state;
         this.validateLineState();
      }
      
      private function validateLineState() : void
      {
         this.txt_line.text = LocaleMgr.ins.getStr(999000314,[curLine]);
         if(lineState)
         {
            var $lineStateArr:Array = lineState.filter(function(param1:LineState, ... rest):Boolean
            {
               return param1.id != curLine;
            });
            this.list_line.repeatY = $lineStateArr.length;
            this.list_line.array = $lineStateArr;
            this.list_line.commitMeasure();
            this.img_listBg.height = list_line.y - img_listBg.y + list_line.height;
            this.btn_arrowDown.visible = list_line.array.length > 0;
            this.buttonMode = list_line.array.length > 0;
         }
         else
         {
            this.btn_arrowDown.visible = false;
         }
      }
      
      private function curLine_onRoll(param1:Boolean) : void
      {
         if(param1 && list_line.array.length > 0)
         {
            this.boxCurLine.filters = [FilterLib.BUTTON_OVER_STATE_20];
         }
         else
         {
            this.boxCurLine.filters = null;
         }
      }
      
      private function this_onClick(param1:MouseEvent) : void
      {
         if(lineState == null)
         {
            return;
         }
         if(this.list_line.array.length == 0)
         {
            return;
         }
         if(isFolderOut == false)
         {
            isFolderOut = true;
            TweenLite.to(this.btn_arrowDown,0.4,{"rotation":90});
            this.img_listBg.visible = true;
            this.list_line.visible = true;
         }
         else
         {
            isFolderOut = false;
            TweenLite.to(this.btn_arrowDown,0.4,{"rotation":0});
            this.img_listBg.visible = false;
            this.list_line.visible = false;
         }
         if(param1)
         {
            param1.stopPropagation();
            param1.stopImmediatePropagation();
         }
      }
      
      private function stage_onClick(param1:MouseEvent) : void
      {
         if(isFolderOut)
         {
            this.this_onClick(null);
         }
      }
      
      private function list_changeHandler(param1:int) : void
      {
         if(isFolderOut)
         {
            this.this_onClick(null);
         }
         var _loc2_:LineState = this.list_line.getItem(param1) as LineState;
         SceneModel.ins.cmd_changeLine(_loc2_.id);
      }
   }
}
