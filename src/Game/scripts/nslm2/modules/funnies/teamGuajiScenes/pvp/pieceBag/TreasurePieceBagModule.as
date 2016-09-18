package nslm2.modules.funnies.teamGuajiScenes.pvp.pieceBag
{
   import game.ui.teamGuajiScenes.pvp.TreasurePieceBagUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.model.TeamGuajiModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.bag.itemModuels.BagModel;
   import morn.core.components.Component;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   
   public class TreasurePieceBagModule extends TreasurePieceBagUI implements INewerGuideCheckHandler, INewerGuideGetComp
   {
       
      
      public function TreasurePieceBagModule()
      {
         super();
         (pageBarUI as IPageBar).bindList(list_piece);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(41300215);
         refresh();
         preShowCpl();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["guaji_update_piece_bag"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("guaji_update_piece_bag" === _loc3_)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         this.list_piece.dataSource = TeamGuajiModel.ins.allTreasurePieceArr;
         txt_empty.visible = !this.list_piece.dataSource.length;
      }
      
      override public function show(param1:Object = null) : void
      {
         NGUtil.checkModuleShow(this.moduleId);
         super.show(param1);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         if(!(int(param1) - 20027))
         {
            _loc5_ = param2[0];
            _loc4_ = StcMgr.ins.getItemVo(_loc5_);
            if(BagModel.ins.getStcCount(_loc5_) >= _loc4_.treasurePieceNeed)
            {
               return 1;
            }
            return 2;
         }
         return 1;
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc3_:* = param1;
         if("btn_compose" !== _loc3_)
         {
            return NGUtil.getCompById(this,param1,param2);
         }
         return (this.list_piece.getCell(0) as TreasurePieceListRender).btn_compose;
      }
   }
}
