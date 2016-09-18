package nslm2.modules.funnies.teamPKCS.report
{
   import game.ui.teamPKCS.report.TPKCReportPanelUI;
   import proto.CteamReport;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import proto.CteamBattle;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TPKCReportPanel extends TPKCReportPanelUI
   {
       
      
      public function TPKCReportPanel()
      {
         super();
         this.list_item.itemRender = TPKCReportRender;
         this.list_item.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9040765);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc6_:* = null;
         var _loc3_:int = 0;
         super.preShow(param1);
         var _loc4_:Array = param1 as Array;
         var _loc7_:Array = [];
         var _loc11_:int = 0;
         var _loc10_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            _loc6_ = new TPKCReportVo();
            _loc6_.type = 0;
            _loc6_.winNameStr = TPKConst.getDistName(_loc5_.winOp,_loc5_.winDist,_loc5_.winName);
            _loc6_.lossNameStr = TPKConst.getDistName(_loc5_.loseOp,_loc5_.loseDist,_loc5_.loseName);
            _loc6_.pos = _loc5_.pos;
            _loc7_.push(_loc6_);
            _loc3_ = 1;
            var _loc9_:int = 0;
            var _loc8_:* = _loc5_.battle;
            for each(var _loc2_ in _loc5_.battle)
            {
               _loc6_ = new TPKCReportVo();
               _loc6_.type = 1;
               _loc6_.battle = _loc2_;
               _loc6_.bOrder = _loc3_;
               _loc7_.push(_loc6_);
               _loc3_++;
            }
         }
         this.list_item.dataSource = _loc7_;
      }
   }
}
