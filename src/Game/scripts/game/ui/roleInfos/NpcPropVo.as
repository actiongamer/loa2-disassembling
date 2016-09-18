package game.ui.roleInfos
{
   import nslm2.common.consts.NPCPropConsts;
   import flash.geom.Point;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import proto.FightProp;
   import morn.core.utils.ObjectUtils;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import morn.core.utils.StringUtils;
   import morn.core.components.Label;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.vos.StcGrowthVo;
   
   public class NpcPropVo
   {
      
      public static const PROPID:String = "propId";
      
      public static const VALUE:String = "value";
       
      
      public var propId:int;
      
      private var _isPrecent:int = -1;
      
      public var isShowColor:Boolean = true;
      
      private var _value:Number = 0;
      
      public var preFix:String = "";
      
      public var floatPos:Point = null;
      
      public var propName:String;
      
      public var fixPos:int;
      
      public var isPercent:Boolean;
      
      public var showArrow:Boolean = false;
      
      public function NpcPropVo(param1:int, param2:Number, param3:String = "", param4:Point = null, param5:* = 0, param6:Boolean = false)
      {
         super();
         this.propId = param1;
         if(isNaN(param2) == true)
         {
            this.value = 0;
         }
         else
         {
            this.value = param2;
         }
         this.preFix = param3;
         this.floatPos = param4;
         this.fixPos = param5;
         isPercent = param6;
      }
      
      public static function getValueColorByPropId(param1:int) : uint
      {
         var _loc2_:* = NPCPropConsts.SHOW_PERCENT_PROP_ID.indexOf(param1) >= 0;
         if(_loc2_)
         {
            return 16542720;
         }
         return 458496;
      }
      
      public static function clone(param1:NpcPropVo) : NpcPropVo
      {
         return new NpcPropVo(param1.propId,param1.value,param1.preFix,param1.floatPos,param1.fixPos,param1.isPercent);
      }
      
      public static function getEmptyPopArr(param1:int, param2:int, param3:Number = 0, param4:String = "", param5:* = 0) : Array
      {
         var _loc7_:* = 0;
         var _loc6_:Array = [];
         _loc7_ = param1;
         while(_loc7_ <= param2)
         {
            _loc6_.push(new NpcPropVo(_loc7_,param3,param4,null,param5));
            _loc7_++;
         }
         _loc6_.sortOn("propId",16);
         return _loc6_;
      }
      
      public static function parseArrStr(param1:String, param2:String = "", param3:Point = null, param4:int = 0, param5:Boolean = true, param6:Boolean = false) : Array
      {
         var _loc11_:int = 0;
         var _loc9_:* = null;
         var _loc8_:Array = [];
         var _loc7_:Array = param1.split("|");
         var _loc10_:int = _loc7_.length;
         _loc11_ = 0;
         while(_loc11_ < _loc10_)
         {
            _loc9_ = _loc7_[_loc11_];
            if(_loc9_ != "0")
            {
               _loc8_.push(parseStr(_loc9_,param2,param3,param4,param6));
            }
            _loc11_++;
         }
         if(param5)
         {
            _loc8_.sortOn("propId",16);
         }
         return _loc8_;
      }
      
      public static function parseStarArrStr(param1:StcEquipAddStarVo, param2:int, param3:String = "", param4:Point = null, param5:int = 0) : Array
      {
         var _loc16_:* = null;
         var _loc14_:* = null;
         var _loc11_:int = 0;
         var _loc8_:* = null;
         var _loc12_:int = 0;
         var _loc9_:int = 0;
         var _loc15_:* = null;
         var _loc6_:Array = [];
         var _loc7_:Array = param1.property.split("|");
         var _loc10_:int = _loc7_.length;
         var _loc13_:int = 0;
         _loc11_ = 0;
         while(_loc11_ < _loc10_)
         {
            _loc14_ = _loc7_[_loc11_];
            _loc8_ = _loc14_.split(":");
            _loc12_ = _loc8_.pop();
            _loc9_ = param1.star;
            while(_loc9_ > 0)
            {
               _loc9_--;
               _loc16_ = StcMgr.ins.getEquipAddStarVo(param1.id - param1.star + _loc9_);
               if(_loc16_)
               {
                  _loc15_ = _loc16_.property.split("|");
                  _loc13_ = _loc13_ + _loc15_[_loc11_].split(":").pop() * _loc16_.totalstep;
               }
            }
            _loc8_.push(_loc12_ * param2 + _loc13_);
            if(_loc14_ == "0")
            {
               _loc8_.unshift(_loc16_.property.split("|")[_loc11_].split(":")[0]);
            }
            _loc14_ = _loc8_.join(":");
            _loc6_.push(parseStr(_loc14_,param3,param4,param5));
            _loc11_++;
         }
         _loc6_.sortOn("propId",16);
         return _loc6_;
      }
      
      public static function parseItemVo(param1:StcItemVo) : Array
      {
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:Array = [];
         var _loc3_:int = NPCPropConsts.ins.baseProp5List.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc2_ = NPCPropConsts.ins.baseProp5List[_loc5_];
            _loc4_.push(new NpcPropVo(_loc2_,int(param1[NPCPropConsts.ins.getStcVoPropertyName(_loc2_)])));
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function parseStr(param1:String, param2:String = "", param3:Point = null, param4:int = 0, param5:Boolean = false) : NpcPropVo
      {
         var _loc6_:Array = param1.split(":");
         return new NpcPropVo(_loc6_[0],_loc6_[1],param2,param3,param4,param5);
      }
      
      public static function parseStr1(param1:String, param2:String = "", param3:Point = null, param4:int = 0) : Array
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc9_:int = 0;
         var _loc7_:Array = [];
         var _loc8_:Array = param1.split("|");
         _loc9_ = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc5_ = _loc8_[_loc9_] as String;
            if(_loc5_ && _loc5_ != "")
            {
               _loc6_ = _loc5_.split(":");
               _loc7_.push(new NpcPropVo(_loc6_[0],_loc6_[1],param2,param3,param4));
            }
            _loc9_++;
         }
         return _loc7_;
      }
      
      public static function parseFightProp(param1:FightProp, param2:String = "", param3:int = 0, param4:Boolean = false) : Array
      {
         var _loc10_:int = 0;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc7_:int = 0;
         var _loc6_:Array = ObjectUtils.constListOfClass(FightProp);
         var _loc5_:Array = [];
         _loc10_ = 0;
         while(_loc10_ < _loc6_.length)
         {
            _loc9_ = _loc6_[_loc10_];
            _loc8_ = FightProp[_loc9_].name;
            if(!isNaN(param1[_loc8_]) && param1[_loc8_] != 0)
            {
               _loc7_ = NPCPropConsts.ins.getIdByProtobufName(_loc8_);
               if(param4 && NPCPropConsts.INIT_IS_ONE_PROP.indexOf(_loc7_) != -1)
               {
                  if(param1[_loc8_] != 1)
                  {
                     _loc5_.push(new NpcPropVo(_loc7_,param1[_loc8_],param2,null,param3));
                  }
               }
               else
               {
                  _loc5_.push(new NpcPropVo(_loc7_,param1[_loc8_],param2,null,param3));
               }
            }
            _loc10_++;
         }
         _loc5_.sortOn("propId",16);
         return _loc5_;
      }
      
      public static function parseFightPropToBaseProp5List(param1:FightProp) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:Array = [];
         var _loc2_:Array = NPCPropConsts.ins.baseProp5List;
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc4_ = NPCPropConsts.ins.getProtobufPropertyName(_loc2_[_loc5_]);
            if(!isNaN(param1[_loc4_]) && param1[_loc4_] != 0)
            {
               _loc3_.push(new NpcPropVo(_loc2_[_loc5_],param1[_loc4_],"",null,0));
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public static function fightPropFromNpcVo(param1:StcNpcVo) : FightProp
      {
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc6_:FightProp = new FightProp();
         var _loc2_:Array = ObjectUtils.constListOfClass(FightProp);
         _loc7_ = 0;
         while(_loc7_ < _loc2_.length)
         {
            _loc5_ = _loc2_[_loc7_];
            _loc4_ = FightProp[_loc5_].name;
            _loc3_ = NPCPropConsts.ins.getStcVoPropertyName(NPCPropConsts.ins.getIdByProtobufName(_loc4_));
            if(StringUtils.isNull(_loc3_) == false)
            {
               _loc6_[_loc4_] = param1[_loc3_];
            }
            _loc7_++;
         }
         return _loc6_;
      }
      
      public static function setLabelColor(param1:Label, param2:NpcPropVo) : void
      {
         if(param2.isShowColor)
         {
            if(param2.isPrecent)
            {
               param1.color = 16542720;
            }
            else
            {
               param1.color = 458496;
            }
         }
      }
      
      public static function unshowAllPropColor(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            (param1[_loc2_] as NpcPropVo).isShowColor = false;
            _loc2_++;
         }
      }
      
      public static function addProp(param1:Array, param2:Array, param3:String = "") : Array
      {
         var _loc5_:int = 0;
         if(param1 == null)
         {
            param1 = [];
         }
         var _loc7_:int = 0;
         var _loc6_:* = param2;
         loop0:
         for each(var _loc4_ in param2)
         {
            _loc5_ = 0;
            while(_loc5_ < param1.length)
            {
               if((param1[_loc5_] as NpcPropVo).propId == _loc4_.propId)
               {
                  (param1[_loc5_] as NpcPropVo).value = (param1[_loc5_] as NpcPropVo).getRealPropValue() + _loc4_.getRealPropValue();
                  continue loop0;
               }
               _loc5_++;
            }
            param1.push(new NpcPropVo(_loc4_.propId,_loc4_.value,param3));
         }
         param1.sortOn("propId",16);
         return param1;
      }
      
      public static function minusStr(param1:Array, param2:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = param2;
         loop0:
         for each(var _loc3_ in param2)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               if((param1[_loc4_] as NpcPropVo).propId == _loc3_.propId)
               {
                  (param1[_loc4_] as NpcPropVo).value = (param1[_loc4_] as NpcPropVo).value - _loc3_.value;
                  param1[_loc4_].preFix = "+";
                  continue loop0;
               }
               _loc4_++;
            }
            param1.push(new NpcPropVo(_loc3_.propId,_loc3_.value,"+"));
         }
         param1.sortOn("propId",16);
         return param1;
      }
      
      public static function createPropArrZero(param1:Array, param2:String = "") : Array
      {
         $propList = param1;
         $preFix = param2;
         return $propList.map(function(param1:int, ... rest):NpcPropVo
         {
            return new NpcPropVo(param1,0,$preFix);
         });
      }
      
      public static function changePrecentTxtToOrange(param1:String, param2:Boolean = true) : String
      {
         var _loc5_:* = undefined;
         var _loc7_:int = 0;
         var _loc6_:RegExp = /\+-?\d*\%/;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(true)
         {
            _loc5_ = _loc6_.exec(param1);
            if(Boolean(_loc5_) != false)
            {
               _loc3_[_loc4_] = _loc5_;
               param1 = param1.replace(_loc5_,TextFieldUtil.htmlText2("{" + _loc4_ + "}",16542720));
               _loc4_++;
               continue;
            }
            break;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            param1 = param1.replace("{" + _loc7_ + "}",_loc3_[_loc7_]);
            _loc7_++;
         }
         return param1;
      }
      
      public static function calNpcBaseProp(param1:int, param2:int) : Array
      {
         var _loc7_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < NPCPropConsts.ins.baseProp5List.length)
         {
            _loc5_ = NPCPropConsts.ins.baseProp5List[_loc7_];
            _loc6_ = StcMgr.ins.getNpcVo(param1);
            _loc3_ = StcMgr.ins.getGrowthVo(_loc6_.grow_id);
            _loc4_.push(new NpcPropVo(_loc5_,Math.floor(_loc6_[NPCPropConsts.ins.getStcVoPropertyName(_loc5_)] + _loc3_[NPCPropConsts.ins.getStcVoPropertyName(_loc5_)] * (param2 - 1))));
            _loc7_++;
         }
         _loc4_.sortOn("propId",16);
         return _loc4_;
      }
      
      public static function filterZeroProp(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.value != 0)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public static function multiplySingleProp(param1:NpcPropVo, param2:Number) : NpcPropVo
      {
         var _loc3_:NpcPropVo = new NpcPropVo(param1.propId,param1.value * param2,param1.preFix,param1.floatPos,1,param1.isPercent);
         return _loc3_;
      }
      
      public function get value() : Number
      {
         if(propId == 22)
         {
            return -_value;
         }
         return _value;
      }
      
      public function get oriValue() : Number
      {
         return _value;
      }
      
      public function set value(param1:Number) : void
      {
         _value = param1;
      }
      
      public function getRealPropValue() : Number
      {
         return _value;
      }
      
      public function get isPrecent() : Boolean
      {
         if(_isPrecent == -1)
         {
            _isPrecent = NPCPropConsts.SHOW_PERCENT_PROP_ID.indexOf(propId) >= 0?1:0;
         }
         return _isPrecent == 1;
      }
      
      public function getValueColor() : uint
      {
         if(isPrecent)
         {
            return 16542720;
         }
         return 458496;
      }
   }
}
