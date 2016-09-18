package nslm2.modules.cultivates.treasure.consts
{
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.treasure.view.TreasureStrenPanel;
   import nslm2.modules.cultivates.treasure.view.TreasureInlayPanel;
   import nslm2.modules.cultivates.treasure.view.RuneBagView;
   import nslm2.modules.cultivates.treasure.view.TreasureKeyinPanel;
   import nslm2.modules.cultivates.treasure.view.TreasurePhasePanel;
   import nslm2.modules.cultivates.treasure.view.TreasurePurifyPanel;
   import nslm2.modules.cultivates.treasure.view.TreasureFuwenKeyinPanel;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.cultivates.treasure.vo.TreasureInfoSubConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.geom.Point;
   
   public class TreasureConsts
   {
      
      public static const AUTO_ADD_BASE_QUALITY:int = 2;
      
      public static const MAX_SELECT_CNT:int = 6;
      
      public static const FLOAT_TXT_OFFSET_X:int = -14;
      
      public static const FLOAT_TXT_OFFSET_X_2:int = -95;
      
      public static const AUTO_STREN_MAX_ICON_NUM:int = 40;
      
      public static const MAX_STAR:int = 10;
      
      public static const MAX_FUWEN_STAR_GOLD:int = 80;
      
      public static const MAX_FUWEN_STAR_RED:int = 60;
      
      public static const MAX_FUWEN_STAR_ORANGE:int = 40;
      
      public static const MAX_TREASURE_CNT:int = 400;
      
      public static const ALERT_TREASURE_CNT:int = 360;
      
      public static const SPECIAL_BUFF_ID:Array = [401100,402100];
      
      public static const TREASURE_REMODULD_BASE:int = 2000000000;
      
      public static const RUNE_COMPOSE_NEED:int = 3;
      
      public static const TREASURE_STATUS_0:int = 0;
      
      public static const TREASURE_STATUS_1:int = 1;
      
      public static const TREASURE_STATUS_2:int = 2;
      
      public static const TREASURE_STATUS_3:int = 3;
      
      public static const MAX_HOLE_CNT:int = 6;
      
      public static const HOLE_STATUS_CAN_NOT_OPEN:int = 0;
      
      public static const HOLE_STATUS_CAN_OPEN:int = 1;
      
      public static const HOLE_STATUS_OPENED:int = 2;
      
      public static const NG_CHECK_HERO:String = "hero";
      
      public static const NG_CHECK_TREASURE:String = "treasure";
      
      public static const BTN_COMPOSE:String = "btn_compose";
      
      public static const CHECK_BOX_STATE:String = "checkBoxState";
      
      public static const subId_strength:int = 30600;
      
      public static const subId_inly:int = 30607;
      
      public static const subId_keyin:int = 30609;
      
      public static const subId_bag:int = 30608;
      
      public static const subId_phase:int = 30613;
      
      public static const subId_purify:int = 30614;
      
      public static const subId_remould:int = 30615;
      
      public static const subId_fuwen_keyin:int = 30616;
      
      public static var subViewStackIdArr:Array = [30600,30607,30608,30609,30613,30615,30616];
      
      public static const subViewBgs:Array = ["png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg","png.uiTreasure2.重铸 洗炼.bg"];
      
      public static const subViewStackPanelArr:Array = [TreasureStrenPanel,TreasureInlayPanel,RuneBagView,TreasureKeyinPanel,TreasurePhasePanel,TreasurePurifyPanel,TreasureFuwenKeyinPanel];
      
      private static var _ins:nslm2.modules.cultivates.treasure.consts.TreasureConsts;
       
      
      private var lib:DictHash;
      
      public function TreasureConsts()
      {
         lib = new DictHash();
         super();
         var _loc1_:TreasureInfoSubConfigVo = new TreasureInfoSubConfigVo(30600,LocaleMgr.ins.getStr(30600007),true,new Point(0,0));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30607,LocaleMgr.ins.getStr(30600008));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30608,LocaleMgr.ins.getStr(9030602));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30609,LocaleMgr.ins.getStr(30609000),true,new Point(0,0));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30613,LocaleMgr.ins.getStr(30600901),true,new Point(0,40));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30614,LocaleMgr.ins.getStr(30615001),true,new Point(0,40));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30615,LocaleMgr.ins.getStr(30615001),true,new Point(0,40));
         lib.put(_loc1_.subId,_loc1_);
         _loc1_ = new TreasureInfoSubConfigVo(30616,LocaleMgr.ins.getStr(30616001),true,new Point(0,40));
         lib.put(_loc1_.subId,_loc1_);
      }
      
      public static function get subIdArr() : Array
      {
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         var _loc3_:* = subViewStackIdArr;
         for each(var _loc2_ in subViewStackIdArr)
         {
            if(FuncOpenAutoCtrl.checkOpen(_loc2_))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public static function get ins() : nslm2.modules.cultivates.treasure.consts.TreasureConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.treasure.consts.TreasureConsts();
         }
         return _ins;
      }
      
      public function getVo(param1:int) : TreasureInfoSubConfigVo
      {
         return lib.getValue(param1);
      }
   }
}
