package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.pkCrossSer.PKCrossTopUI;
   import proto.CrossArenaEnemyInfo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import proto.CrossArenaBoxStatus;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.utils.WealthUtil;
   import nslm2.common.ctrls.ProgressBarCtrl;
   
   public class PKCrossTop extends PKCrossTopUI
   {
       
      
      private var pkBoxCtrls:Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossBoxCtrl>;
      
      public function PKCrossTop()
      {
         var _loc3_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         pkBoxCtrls = new Vector.<nslm2.modules.funnies.pkCrossSer.PKCrossBoxCtrl>();
         super();
         this.parts.push(new ProgressBarCtrl(this.progressBar).splitCnt(5));
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _loc2_ = this["box" + _loc3_] as TreasureBoxBaseRender;
            _loc1_ = new nslm2.modules.funnies.pkCrossSer.PKCrossBoxCtrl(_loc2_);
            _loc1_.layer = _loc3_ + 1;
            this.parts.push(_loc1_);
            pkBoxCtrls.push(_loc1_);
            _loc3_++;
         }
      }
      
      public function setData(param1:Array, param2:int, param3:Array) : void
      {
         var _loc11_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         param1.sortOn("layer");
         param2--;
         param2 = Math.max(0,param2);
         var _loc7_:int = 0;
         var _loc13_:int = 0;
         var _loc12_:* = param3;
         for each(var _loc4_ in param3)
         {
            if(_loc4_.status == 0)
            {
               _loc7_++;
            }
         }
         this.progressBar.value = (param2 * 5 + _loc7_) / (5 * 5);
         var _loc8_:Array = String(DefindConsts.CROSS_ARENA_LAYER_BOXES).split("|");
         _loc11_ = 0;
         while(_loc11_ < 5)
         {
            _loc6_ = LocaleMgr.ins.getStr(50600006,[_loc11_ + 1]);
            if(_loc11_ < param2)
            {
               _loc6_ = _loc6_ + "(5/5)";
            }
            else if(_loc11_ == param2)
            {
               _loc6_ = _loc6_ + ("(" + _loc7_ + "/5)");
            }
            else
            {
               _loc6_ = _loc6_ + "(0/5)";
            }
            this["txt_" + _loc11_].text = _loc6_;
            _loc5_ = this["box" + _loc11_] as TreasureBoxBaseRender;
            _loc5_.treasureType = _loc11_ > 2?2:_loc11_;
            _loc9_ = param1[_loc11_];
            _loc10_ = new TreasureBoxVo(WealthUtil.dropGroupIDToWealthVoArr(int(_loc8_[_loc11_])),_loc9_.status + 1,LocaleMgr.ins.getStr(50600007,[_loc11_ + 1]));
            pkBoxCtrls[_loc11_].vo = _loc10_;
            _loc11_++;
         }
      }
   }
}
