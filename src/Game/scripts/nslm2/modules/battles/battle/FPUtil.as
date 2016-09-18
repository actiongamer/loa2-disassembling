package nslm2.modules.battles.battle
{
   import morn.core.utils.ObjectUtils;
   import morn.core.utils.StringUtils;
   import nslm2.modules.fightPlayer.UnitVo;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import away3d.materials.methods.ColorMatrixMethod;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.battles.battle.skillConfig.SkillConfig;
   import flash.utils.Dictionary;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSkillEffectVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import com.mz.core.logging.Log;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.fightPlayer.FPConsts;
   import com.netease.protobuf.Message;
   import flash.utils.ByteArray;
   import nslm2.nets.imsdk.Base64;
   
   public class FPUtil
   {
      
      public static var CModule;
      
      private static var grayColorMethod:ColorMatrixMethod;
      
      private static var darkColorMethod:ColorMatrixMethod;
      
      private static var darkColorMethod4:ColorMatrixMethod;
      
      private static var darkColorMethod7:ColorMatrixMethod;
      
      private static var skillEffectDic:Dictionary;
       
      
      public function FPUtil()
      {
         super();
      }
      
      public static function voToCC(param1:Object, param2:Object) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc6_:Array = ObjectUtils.varListOfOb(param2,false,true);
         var _loc4_:int = _loc6_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = _loc6_[_loc5_];
            if(param1.hasOwnProperty(_loc3_))
            {
               if(param1[_loc3_] is String)
               {
                  param2[_loc3_] = CModule.mallocString(param1[_loc3_]);
               }
               else
               {
                  param2[_loc3_] = param1[_loc3_];
               }
            }
            _loc5_++;
         }
      }
      
      public static function protoVoToVo(param1:Object, param2:Object, param3:Class) : void
      {
         var _loc9_:int = 0;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:Array = ["x","y","skillSort","sex"];
         var _loc8_:Array = ObjectUtils.constListOfClass(param3);
         _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc7_ = _loc8_[_loc9_];
            _loc6_ = proto.BattlePlayer[_loc7_].name;
            if(_loc5_.indexOf(_loc6_) == -1)
            {
               if(param2.hasOwnProperty(_loc6_))
               {
                  param2[_loc6_] = NaNtoZero(param1[_loc6_]);
               }
               else
               {
                  _loc4_ = StringUtils.camelCaseToUnderline(_loc6_);
                  if(param2.hasOwnProperty(_loc4_))
                  {
                     param2[_loc4_] = NaNtoZero(param1[_loc6_]);
                  }
               }
            }
            _loc9_++;
         }
      }
      
      public static function voArrToCC(param1:UnitVo, param2:Object) : void
      {
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:Array = ObjectUtils.varListOfOb(param2,false,true);
         var _loc4_:int = _loc7_.length;
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc3_ = _loc7_[_loc6_];
            _loc5_ = [param1.stcNpcVo,param1];
            if(param1.serVo)
            {
               _loc5_.push(param1.serVo);
               if(param1.serVo.prop)
               {
                  _loc5_.push(param1.serVo.prop);
               }
            }
            voArrParamToCC(_loc5_,param2,_loc3_);
            _loc6_++;
         }
         param2.damage_increase_ratio = !!param1.serVo?NaNtoZero(param1.serVo.prop.demageAdd):param1.stcNpcVo.damage_increase_ratio;
      }
      
      private static function voArrParamToCC(param1:Array, param2:Object, param3:String) : void
      {
         var _loc8_:int = 0;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc6_:Boolean = false;
         var _loc5_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc7_ = param1[_loc8_];
            if(_loc7_.hasOwnProperty(param3))
            {
               _loc6_ = true;
               if(_loc7_[param3] is String)
               {
                  param2[param3] = CModule.mallocString(_loc7_[param3]);
               }
               else
               {
                  param2[param3] = NaNtoZero(_loc7_[param3]);
               }
            }
            else
            {
               _loc4_ = StringUtils.underlineToCamelCase(param3);
               if(_loc7_.hasOwnProperty(_loc4_))
               {
                  if(_loc7_[_loc4_] is String)
                  {
                     param2[param3] = CModule.mallocString(_loc7_[_loc4_]);
                  }
                  else
                  {
                     param2[param3] = NaNtoZero(_loc7_[_loc4_]);
                  }
               }
            }
            _loc8_++;
         }
         if(_loc6_ == false)
         {
         }
      }
      
      public static function NaNtoZero(param1:*) : *
      {
         if(param1 is String)
         {
            return param1;
         }
         return !!isNaN(param1)?0:param1;
      }
      
      public static function nextXY(param1:Point, param2:Point, param3:int) : Point
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(param3 <= 0)
         {
            return param2.clone();
         }
         _loc4_ = MathUtil.roWith2Point(param1,param2);
         _loc5_ = MathUtil.disWith2Point(param1,param2) / param3;
         return MathUtil.nextPoint(param1,_loc4_,_loc5_);
      }
      
      public static function getGrayMethod() : ColorMatrixMethod
      {
         var _loc1_:* = null;
         if(!grayColorMethod)
         {
            _loc1_ = [];
            _loc1_ = _loc1_.concat([0.3,0.6,0,0,0]);
            _loc1_ = _loc1_.concat([0.3,0.6,0,0,0]);
            _loc1_ = _loc1_.concat([0.3,0.6,0,0,0]);
            _loc1_ = _loc1_.concat([0,0,0,0.8,0]);
            grayColorMethod = new ColorMatrixMethod(_loc1_);
         }
         return grayColorMethod;
      }
      
      public static function getDarkMethod() : ColorMatrixMethod
      {
         var _loc1_:* = null;
         if(!darkColorMethod)
         {
            _loc1_ = [];
            _loc1_ = _loc1_.concat([1,0,0,0,-0.2]);
            _loc1_ = _loc1_.concat([0,1,0,0,-0.2]);
            _loc1_ = _loc1_.concat([0,0,1,0,-0.2]);
            _loc1_ = _loc1_.concat([0,0,0,1,0]);
            darkColorMethod = new ColorMatrixMethod(_loc1_);
         }
         return darkColorMethod;
      }
      
      public static function getDarkMethod4() : ColorMatrixMethod
      {
         var _loc1_:* = null;
         var _loc2_:* = -0.4;
         if(!darkColorMethod4)
         {
            _loc1_ = [];
            _loc1_ = _loc1_.concat([1,0,0,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,1,0,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,0,1,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,0,0,1,0]);
            darkColorMethod4 = new ColorMatrixMethod(_loc1_);
         }
         return darkColorMethod4;
      }
      
      public static function getDarkMethod7() : ColorMatrixMethod
      {
         var _loc1_:* = null;
         var _loc2_:* = -0.7;
         if(!darkColorMethod7)
         {
            _loc1_ = [];
            _loc1_ = _loc1_.concat([1,0,0,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,1,0,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,0,1,0,_loc2_]);
            _loc1_ = _loc1_.concat([0,0,0,1,0]);
            darkColorMethod7 = new ColorMatrixMethod(_loc1_);
         }
         return darkColorMethod7;
      }
      
      public static function getBattleEffectIdByVos(param1:Array) : Array
      {
         var _loc2_:Array = [600002,600004];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            ArrayUtil.append(_loc2_,getEffectIdByNpcVo(_loc3_.stcNpcVo));
         }
         return ArrayUtil.removeRepeat(_loc2_);
      }
      
      public static function getEffectIdByNpcVo(param1:StcNpcVo) : Array
      {
         var _loc3_:Array = [];
         ArrayUtil.append(_loc3_,getEffectIdByDieId(int(param1.model_id)));
         var _loc2_:Array = [param1.normal_attack_id,param1.skill_id1,param1.skill_id2,param1.skill_id3,param1.skill_id4];
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc4_ in _loc2_)
         {
            if(_loc4_ > 0)
            {
               ArrayUtil.append(_loc3_,getEffectIdBySkillId(_loc4_));
            }
         }
         return _loc3_;
      }
      
      private static function getEffectIdByDieId(param1:int) : Array
      {
         var _loc2_:Array = [];
         var _loc4_:Array = SkillConfig.configDic["die_" + param1];
         _loc4_ = !!_loc4_?_loc4_.concat():[];
         ArrayUtil.append(_loc4_,SkillConfig.configDic["reborn_" + param1]);
         var _loc6_:int = 0;
         var _loc5_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            if(String(_loc3_.action).indexOf("Eff") != -1)
            {
               _loc2_.push(int(_loc3_.name));
            }
         }
         return _loc2_;
      }
      
      public static function getSkillEffectBySkillId(param1:int) : Array
      {
         var _loc2_:* = null;
         if(!skillEffectDic)
         {
            skillEffectDic = new Dictionary();
            var _loc5_:int = 0;
            var _loc4_:* = StcMgr.ins.getTabelArr("static_skill_effect");
            for each(var _loc3_ in StcMgr.ins.getTabelArr("static_skill_effect"))
            {
               _loc2_ = skillEffectDic[_loc3_.skill_id];
               if(skillEffectDic[_loc3_.skill_id] == null)
               {
                  _loc2_ = [];
                  skillEffectDic[_loc3_.skill_id] = _loc2_;
               }
               _loc2_.push(_loc3_);
            }
         }
         return skillEffectDic[param1];
      }
      
      private static function getEffectIdBySkillId(param1:int) : Array
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc9_:* = null;
         var _loc2_:int = 0;
         var _loc4_:Array = [];
         var _loc7_:Array = getSkillEffectBySkillId(param1);
         var _loc13_:int = 0;
         var _loc12_:* = _loc7_;
         for each(var _loc11_ in _loc7_)
         {
            _loc6_ = _loc11_.hit_effect;
            if(_loc6_ > 0)
            {
               _loc4_.push(_loc6_);
            }
         }
         var _loc10_:StcSkillVo = StcMgr.ins.getSkillVo(param1);
         if(_loc10_)
         {
            _loc5_ = _loc10_.node_id;
            _loc9_ = SkillConfig.configDic["front_" + _loc5_];
            var _loc15_:int = 0;
            var _loc14_:* = _loc9_;
            for each(var _loc8_ in _loc9_)
            {
               if(String(_loc8_.action).indexOf("Eff") != -1)
               {
                  _loc4_.push(int(_loc8_.name));
               }
            }
         }
         else
         {
            Log.error(FPUtil,"缺少技能",param1);
         }
         var _loc3_:StcBuffVo = StcMgr.ins.getBuffVo(param1);
         if(_loc3_ && !StringUtils.isNull(_loc3_.display_effect_id))
         {
            if(_loc3_.display_effect_id.indexOf("|") == -1)
            {
               _loc2_ = _loc3_.display_effect_id;
            }
            else
            {
               _loc2_ = _loc3_.display_effect_id.split("|")[0];
            }
            if(_loc2_ > 0)
            {
               _loc4_.push(_loc2_);
            }
         }
         return _loc4_;
      }
      
      public static function genBattleId(param1:int, param2:int) : uint
      {
         return (param1 == 1?1000:Number(2000)) + param2;
      }
      
      public static function getFrontConfigById(param1:int) : Array
      {
         return SkillConfig.configDic["front_" + param1];
      }
      
      public static function fixFrame(param1:Number) : Number
      {
         var _loc2_:Number = nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS;
         return param1 * (1 / _loc2_);
      }
      
      public static function fixFrame2(param1:Number) : Number
      {
         var _loc2_:* = 30;
         return param1 * (1 / _loc2_);
      }
      
      public static function overTime(param1:Number) : Number
      {
         return param1 / (nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS / FPConsts.speed_value[0]);
      }
      
      public static function playSpeed() : Number
      {
         return nslm2.modules.battles.battle.BattlePlayer.CYCLES_FPS / 30;
      }
      
      public static function getRearConfigById(param1:int) : Array
      {
         return SkillConfig.configDic["rear_" + param1];
      }
      
      public static function getHurtConfigById(param1:String, param2:int) : Array
      {
         var _loc3_:Array = SkillConfig.configDic["hurt_" + param1 + "_" + param2];
         return !!_loc3_?_loc3_:SkillConfig["hurt_" + param1];
      }
      
      public static function getDieFallById(param1:String) : Array
      {
         var _loc2_:Array = SkillConfig.configDic["die_fall_" + param1];
         return !!_loc2_?_loc2_:SkillConfig.defaultDie;
      }
      
      public static function getDieConfigById(param1:String) : Array
      {
         var _loc2_:Array = SkillConfig.configDic["die_" + param1];
         return !!_loc2_?_loc2_:SkillConfig.defaultDie;
      }
      
      public static function getRebornConfigById(param1:String) : Array
      {
         return SkillConfig.configDic["reborn_" + param1];
      }
      
      public static function protoToBase64(param1:Message) : String
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         param1.writeTo(_loc3_);
         _loc3_.position = 0;
         var _loc2_:String = Base64.encodeByteArray(_loc3_);
         return _loc2_;
      }
      
      public static function getStpString(param1:Array) : String
      {
         var _loc3_:int = 0;
         var _loc2_:* = undefined;
         var _loc4_:String = "[";
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = param1[_loc3_];
            _loc4_ = _loc4_ + ("{objId:" + _loc2_.objId + ",timePoint:" + _loc2_.timePoint + "}");
            if(_loc3_ != param1.length - 1)
            {
               _loc4_ = _loc4_ + ",";
            }
            _loc3_++;
         }
         _loc4_ = _loc4_ + "]\n";
         return _loc4_;
      }
      
      public static function getAddHpByBuff(param1:proto.BattlePlayer) : Number
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc3_:String = param1.buff;
         if(_loc3_ == null)
         {
            return 0;
         }
         var _loc4_:Array = _loc3_.split("|");
         var _loc2_:* = 0;
         var _loc10_:int = 0;
         var _loc9_:* = _loc4_;
         for each(var _loc5_ in _loc4_)
         {
            _loc7_ = _loc5_.split(":");
            _loc8_ = _loc7_[0];
            _loc6_ = StcMgr.ins.getBuffVo(_loc8_);
            if(_loc6_ && _loc6_.effect_type == 15)
            {
               _loc2_ = Number(_loc2_ + param1.hpMax * _loc7_[2]);
            }
         }
         return _loc2_;
      }
      
      public static function getEnemyHPSum(param1:Array) : Object
      {
         var _loc3_:* = 0;
         var _loc2_:* = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            if(_loc4_.isAttack == 0)
            {
               _loc3_ = Number(_loc3_ + _loc4_.hp);
               _loc2_ = Number(_loc2_ + _loc4_.hp_max);
            }
         }
         return {
            "hpSum":_loc3_,
            "hpMaxSum":_loc2_
         };
      }
   }
}
