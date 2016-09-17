package nslm2.modules.foundations.recycle
{
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.modules.foundations.HelpAndRuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.foundations.recycle.consts.RecycleConsts;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcHeroNodeVo;
   import nslm2.mgrs.stcMgrs.vos.StcTupoVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   
   public class RecycleUtil
   {
       
      
      public function RecycleUtil()
      {
         super();
      }
      
      public static function showHelp() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = RecycleModel.ins.crtFunctionType;
         if(0 !== _loc2_)
         {
            if(1 !== _loc2_)
            {
               if(2 !== _loc2_)
               {
                  if(3 !== _loc2_)
                  {
                     if(RecycleConsts.REC_TYPE_EQUIP_REBORN !== _loc2_)
                     {
                        if(RecycleConsts.REC_TYPE_TREASURE !== _loc2_)
                        {
                           if(6 !== _loc2_)
                           {
                              if(7 === _loc2_)
                              {
                                 _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300062));
                              }
                           }
                           else
                           {
                              _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(109001019),LocaleMgr.ins.getStr(109001018));
                           }
                        }
                        else
                        {
                           _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(30609303));
                        }
                     }
                     else
                     {
                        _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(30006309));
                     }
                  }
                  else
                  {
                     _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300029));
                  }
               }
               else
               {
                  _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300028));
               }
            }
            else
            {
               _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(11300027));
            }
         }
         else
         {
            _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(11300026));
         }
         ModuleMgr.ins.showModule(12201,_loc1_,11300);
      }
      
      public static function getRuleDes() : HelpAndRuleParam
      {
         var _loc1_:* = null;
         var _loc2_:* = RecycleModel.ins.crtFunctionType;
         if(0 !== _loc2_)
         {
            if(1 !== _loc2_)
            {
               if(2 !== _loc2_)
               {
                  if(3 !== _loc2_)
                  {
                     if(RecycleConsts.REC_TYPE_EQUIP_REBORN !== _loc2_)
                     {
                        if(RecycleConsts.REC_TYPE_TREASURE !== _loc2_)
                        {
                           if(6 !== _loc2_)
                           {
                              if(7 === _loc2_)
                              {
                                 _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300062));
                              }
                           }
                           else
                           {
                              _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(109001019),LocaleMgr.ins.getStr(109001018));
                           }
                        }
                        else
                        {
                           _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(30609303));
                        }
                     }
                     else
                     {
                        _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(30006309));
                     }
                  }
                  else
                  {
                     _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300029));
                  }
               }
               else
               {
                  _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000357),LocaleMgr.ins.getStr(11300028));
               }
            }
            else
            {
               _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(11300027));
            }
         }
         else
         {
            _loc1_ = new HelpAndRuleParam(LocaleMgr.ins.getStr(999000356),LocaleMgr.ins.getStr(11300026));
         }
         return _loc1_;
      }
      
      public static function getChangeCostWealthVoArr(param1:int, param2:int, param3:int) : Array
      {
         var _loc8_:int = 0;
         var _loc13_:* = null;
         var _loc9_:* = null;
         var _loc7_:int = 0;
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         var _loc11_:StcNpcVo = StcMgr.ins.getNpcVo(param2);
         var _loc15_:StcHeroNodeVo = StcMgr.ins.getHeroNodeVo(_loc5_.node);
         var _loc10_:StcHeroNodeVo = StcMgr.ins.getHeroNodeVo(_loc11_.node);
         var _loc14_:Array = !!_loc15_.isRare?_loc10_.fromHighCostArr:_loc10_.fromLowCostArr;
         var _loc4_:int = 1;
         var _loc6_:Array = StcMgr.ins.getVoArrByMultiColumnValue("static_npc",["node"],[_loc11_.node]);
         var _loc12_:int = _loc6_.length;
         _loc8_ = 0;
         while(_loc8_ < _loc12_)
         {
            if((_loc6_[_loc8_] as StcNpcVo).tupo < param3)
            {
               _loc13_ = StcMgr.ins.getTupoVo((_loc6_[_loc8_] as StcNpcVo).id);
               if(StringUtils.isNull(_loc13_.cost_hero) == false)
               {
                  _loc9_ = WealthUtil.parseCostStr(_loc13_.cost_hero);
                  _loc4_ = _loc4_ + _loc9_.count;
               }
            }
            _loc8_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc14_.length)
         {
            (_loc14_[_loc7_] as WealthVo).count = (_loc14_[_loc7_] as WealthVo).count * _loc4_;
            _loc7_++;
         }
         return _loc14_;
      }
   }
}
