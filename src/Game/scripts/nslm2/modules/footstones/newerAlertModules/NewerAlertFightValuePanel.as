package nslm2.modules.footstones.newerAlertModules
{
   import game.ui.newerAlertModules.NewerAlertFightValuePanelUI;
   import nslm2.modules.Chapters.ChapterModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcStageVo;
   import nslm2.mgrs.stcMgrs.vos.StcChapterVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   
   public class NewerAlertFightValuePanel extends NewerAlertFightValuePanelUI implements INewerAlert
   {
       
      
      private var _showingFuncId:int;
      
      public function NewerAlertFightValuePanel()
      {
         super();
      }
      
      public function show(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         _showingFuncId = param1;
         var _loc6_:* = param1;
         if(40408 !== _loc6_)
         {
            if(41210 !== _loc6_)
            {
               if(41500 === _loc6_)
               {
                  this.txt_desc.text = LocaleMgr.ins.getStr(999001122,[ShenYuanModel.ins.crtFloor]);
               }
            }
            else
            {
               _loc4_ = LocaleMgr.ins.getStr(41210800 + TeamGuajiService.ins.sceneInfo.curGuajiId + 1);
               this.txt_desc.text = LocaleMgr.ins.getStr(999001121,[_loc4_]);
            }
         }
         else
         {
            _loc3_ = ChapterModel.ins.nextStageIdDic.getValue(2);
            _loc2_ = StcMgr.ins.getStageVo(_loc3_);
            if(_loc2_)
            {
               _loc5_ = StcMgr.ins.getChapterVo(_loc2_.chapter_id);
               this.txt_desc.text = LocaleMgr.ins.getStr(999001120,[LocaleMgr.ins.getStr(_loc5_.name),LocaleMgr.ins.getStr(_loc2_.name)]);
            }
         }
      }
      
      public function btnCloseHandler() : void
      {
      }
   }
}
