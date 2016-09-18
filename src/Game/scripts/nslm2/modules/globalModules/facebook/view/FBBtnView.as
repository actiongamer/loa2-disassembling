package nslm2.modules.globalModules.facebook.view
{
   import game.ui.commons.comps.btns.BtnFaceBookUI;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import nslm2.modules.globalModules.facebook.control.FBBtnControl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import org.specter3d.utils.StringUtil;
   
   public class FBBtnView extends BtnFaceBookUI
   {
       
      
      private var _faceBookFeedVo:StcFacebookFeedVo;
      
      private var _content:String;
      
      public function FBBtnView()
      {
         super();
         this.addEventListener("addedToStage",addToStage);
      }
      
      protected function addToStage(param1:Event) : void
      {
         this.removeEventListener("addedToStage",addToStage);
         addListeners();
         show();
         this.addEventListener("removedFromStage",removeFromStage);
      }
      
      protected function removeFromStage(param1:Event) : void
      {
         this.addEventListener("removedFromStage",removeFromStage);
         removeListeners();
         hide();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function addListeners() : void
      {
         faceBookBtn.addEventListener("click",faceBookBtnClick);
      }
      
      private function removeListeners() : void
      {
         faceBookBtn.removeEventListener("click",faceBookBtnClick);
      }
      
      protected function faceBookBtnClick(param1:MouseEvent) : void
      {
         if(_faceBookFeedVo)
         {
            FBBtnControl.instance.reqFaceBookFeed(_faceBookFeedVo,_content);
            faceBookBtn.disabled = true;
         }
      }
      
      private function show() : void
      {
      }
      
      private function hide() : void
      {
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         faceBookBtn.disabled = false;
         _faceBookFeedVo = StcMgr.ins.getFacebookFeedVo(int(param1.feedId));
         if(_faceBookFeedVo)
         {
            switch(int(_faceBookFeedVo.feedType) - 1)
            {
               case 0:
                  if(int(_faceBookFeedVo.para_1) == 1)
                  {
                     _content = LocaleMgr.ins.getStr(_faceBookFeedVo.description);
                  }
                  else if(int(_faceBookFeedVo.para_1) == 2)
                  {
                     _loc2_ = StcMgr.ins.getStageVo(int(_faceBookFeedVo.para_2));
                     _content = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),LocaleMgr.ins.getStr(_loc2_.name));
                  }
                  else if(int(_faceBookFeedVo.para_1) == 3)
                  {
                     _content = LocaleMgr.ins.getStr(_faceBookFeedVo.description);
                  }
                  break;
               case 1:
               case 2:
                  _content = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),param1.para_1);
                  break;
               default:
               case 4:
               case 5:
                  _content = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),param1.para_1);
                  break;
               default:
                  _content = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),param1.para_1);
                  break;
               case 7:
                  _content = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),param1.para_1,param1.para_2);
            }
         }
      }
      
      override public function dispose() : void
      {
         if(this.hasEventListener("addedToStage"))
         {
            this.removeEventListener("addedToStage",addToStage);
         }
         super.dispose();
      }
   }
}
