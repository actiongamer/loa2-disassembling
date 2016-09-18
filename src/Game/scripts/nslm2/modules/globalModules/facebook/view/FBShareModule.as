package nslm2.modules.globalModules.facebook.view
{
   import game.ui.facebook.FBShareViewUI;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookFeedVo;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import org.specter3d.utils.StringUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class FBShareModule extends FBShareViewUI
   {
       
      
      private var _obj:Object;
      
      private var _faceBookFeedVo:StcFacebookFeedVo;
      
      public function FBShareModule()
      {
         super();
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000831);
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
      }
      
      public function get fbBtnView() : FBBtnView
      {
         return faceBookView as FBBtnView;
      }
      
      private function onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(fbBtnView.faceBookBtn === _loc3_)
         {
            if(_obj && _faceBookFeedVo)
            {
               fbBtnView.dataSource = {
                  "feedId":_faceBookFeedVo.ID,
                  "para_1":_obj.para_1,
                  "para_2":_obj.para_2
               };
               if(_faceBookFeedVo.feedType == 8)
               {
                  ModuleMgr.ins.showModule(13000,1,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         decTxt.visible = false;
         rawardList.visible = false;
         super.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         _obj = param1;
         if(_obj == null)
         {
            return;
         }
         _faceBookFeedVo = param1.vo as StcFacebookFeedVo;
         if(_faceBookFeedVo == null)
         {
            return;
         }
         decTxt.text = StringUtil.substitute(LocaleMgr.ins.getStr(_faceBookFeedVo.description),param1.para_1,param1.para_2);
         decTxt.visible = true;
         if(_faceBookFeedVo.para_2 == "1")
         {
            rawardList.dataSource = WealthUtil.costStrToArr(_faceBookFeedVo.para_3);
            rawardList.visible = true;
            fbBtnView.faceBookBtn.label = LocaleMgr.ins.getStr(999000832);
         }
         else
         {
            fbBtnView.faceBookBtn.label = LocaleMgr.ins.getStr(999000833);
            rawardList.visible = false;
         }
         fbBtnView.dataSource = {
            "feedId":_faceBookFeedVo.ID,
            "para_1":param1.para_1,
            "para_2":param1.para_2
         };
      }
   }
}
