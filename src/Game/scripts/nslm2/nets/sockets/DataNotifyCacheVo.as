package nslm2.nets.sockets
{
   import proto.PlayerDataNotify;
   import nslm2.common.model.OldPlayerData;
   import nslm2.common.model.ChangePlayerData;
   import nslm2.common.model.PlayerModel;
   import nslm2.common.model.ChangePlayerWealthVo;
   import proto.Source;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcLevelVo;
   
   public class DataNotifyCacheVo
   {
      
      public static const TRIGGER_CMD:String = "triggerCmd";
       
      
      public var triggerCmd:int;
      
      public var playerDataNotify:PlayerDataNotify;
      
      public var old:OldPlayerData;
      
      public var change:ChangePlayerData;
      
      public function DataNotifyCacheVo(param1:PlayerDataNotify)
      {
         super();
         if(param1)
         {
            this.triggerCmd = param1.cmd;
            this.playerDataNotify = param1;
            countOldAndChange();
         }
      }
      
      private function countOldAndChange() : void
      {
         var _loc8_:int = 0;
         var _loc15_:* = null;
         var _loc9_:* = null;
         var _loc2_:Number = NaN;
         var _loc11_:Boolean = false;
         var _loc10_:* = NaN;
         var _loc4_:* = null;
         var _loc3_:Number = NaN;
         var _loc13_:* = null;
         var _loc6_:Number = NaN;
         var _loc12_:Number = NaN;
         if(PlayerModel.ins.playerInfo == null)
         {
            return;
         }
         var _loc7_:PlayerDataNotify = this.playerDataNotify;
         old = new OldPlayerData();
         var _loc14_:OldPlayerData = new OldPlayerData();
         change = new ChangePlayerData();
         var _loc1_:ChangePlayerData = new ChangePlayerData();
         _loc14_.source = [];
         _loc1_.wealthArr = new Vector.<ChangePlayerWealthVo>();
         var _loc5_:int = _loc7_.source.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc15_ = _loc7_.source[_loc8_];
            _loc9_ = new Source();
            _loc9_.kind = _loc15_.kind;
            _loc9_.count = PlayerModel.ins.getWealthValue(_loc15_.kind);
            _loc14_.source.push(_loc9_);
            _loc1_.wealthArr.push(new ChangePlayerWealthVo(_loc15_.kind,_loc15_.count - _loc9_.count));
            _loc8_++;
         }
         if(_loc7_.hasInfo)
         {
            if(_loc7_.info.hasAbility)
            {
               _loc2_ = Uint64Util.toNumber(_loc7_.info.ability);
               _loc14_.ability = PlayerModel.ins.totalFightValue;
               _loc1_.ability = _loc2_ - PlayerModel.ins.totalFightValue;
            }
            _loc11_ = false;
            if(_loc7_.info.hasLv)
            {
               _loc11_ = true;
               _loc14_.lv = PlayerModel.ins.level;
               _loc1_.lv = _loc7_.info.lv - _loc14_.lv;
               _loc4_ = StcMgr.ins.getVoByMultiColumnValue("static_level",["level","kind"],[_loc7_.info.lv,1]);
               _loc10_ = Number(_loc4_.all_exp);
            }
            if(_loc7_.info.hasExp)
            {
               _loc11_ = true;
               _loc14_.curExp = PlayerModel.ins.exp;
               _loc3_ = Uint64Util.toNumber(_loc7_.info.exp);
            }
            else
            {
               _loc3_ = PlayerModel.ins.exp;
            }
            if(_loc11_)
            {
               _loc13_ = StcMgr.ins.getVoByMultiColumnValue("static_level",["level","kind"],[PlayerModel.ins.level,1]);
               _loc6_ = _loc13_.all_exp;
               if(_loc1_.lv == 0)
               {
                  _loc10_ = _loc6_;
               }
               _loc12_ = _loc10_ + _loc3_;
               old.totalExp = _loc6_ + PlayerModel.ins.exp;
               _loc1_.totalExp = _loc12_ - old.totalExp;
            }
         }
         if(_loc7_.addItems)
         {
            _loc1_.addItems = _loc7_.addItems;
         }
         if(_loc7_.reduceItems)
         {
            _loc1_.reduceItems = _loc7_.reduceItems;
         }
         if(_loc7_.addHeroes)
         {
            _loc1_.addHeroes = _loc7_.addHeroes;
         }
         if(_loc7_.reduceHeroes)
         {
            _loc1_.reduceHeroes = _loc7_.reduceHeroes;
         }
         if(_loc7_.addBaowu)
         {
            _loc1_.addBaowu = _loc7_.addBaowu;
         }
         if(_loc7_.reduceBaowu)
         {
            _loc1_.reduceBaowu = _loc7_.reduceBaowu;
         }
      }
   }
}
