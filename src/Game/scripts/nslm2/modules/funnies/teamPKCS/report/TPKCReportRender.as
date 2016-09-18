package nslm2.modules.funnies.teamPKCS.report
{
   import game.ui.teamPKCS.report.TPKCReportRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TPKCReportRender extends TPKCReportRenderUI
   {
       
      
      public function TPKCReportRender()
      {
         super();
         this.txt_playback.addEventListener("click",playBack_onClick);
         this.txt_playback.buttonMode = true;
         this.txt_playback.mouseChildren = false;
      }
      
      private function playBack_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(dataSource)
         {
            _loc2_ = dataSource as TPKCReportVo;
            _loc3_ = BattleReportParamVo.createIds([_loc2_.battle.battleId]);
            _loc3_.type = 1;
            ModuleMgr.ins.showModule(40201,_loc3_);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:TPKCReportVo = param1 as TPKCReportVo;
         if(_loc5_)
         {
            if(_loc5_.type == 0)
            {
               this.box_con.visible = false;
               this.box_title.visible = true;
               if(_loc5_.pos == 1)
               {
                  this.t0.text = _loc5_.winNameStr;
                  this.t1.text = _loc5_.lossNameStr;
               }
               else
               {
                  this.t0.text = _loc5_.lossNameStr;
                  this.t1.text = _loc5_.winNameStr;
               }
            }
            else
            {
               this.img_bbg.visible = _loc5_.bOrder % 2 == 0;
               this.box_con.visible = true;
               this.box_title.visible = false;
               _loc4_ = LocaleMgr.ins.getStr(50800035);
               _loc3_ = LocaleMgr.ins.getStr(50800036);
               _loc2_ = LocaleMgr.ins.getStr(50800037);
               this.txt_info.text = LocaleMgr.ins.getStr(50800034,[_loc5_.bOrder]);
               trace(_loc5_.battle.pos);
               if(_loc5_.battle.pos == 1)
               {
                  this.txt_info.text = this.txt_info.text + (_loc4_ + " " + _loc5_.battle.winName);
               }
               else
               {
                  this.txt_info.text = this.txt_info.text + (_loc3_ + " " + _loc5_.battle.loseName);
               }
               this.txt_info.text = this.txt_info.text + (" " + _loc2_ + " ");
               if(_loc5_.battle.pos == 2)
               {
                  this.txt_info.text = this.txt_info.text + (_loc5_.battle.winName + " " + _loc4_);
               }
               else
               {
                  this.txt_info.text = this.txt_info.text + (_loc5_.battle.loseName + " " + _loc3_);
               }
            }
         }
      }
   }
}
