package proto
{
   import com.netease.protobuf.Message;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import com.netease.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import flash.errors.IOError;
   
   public class OpActivityStatic extends Message
   {
      
      public static const KIND:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("proto.OpActivityStatic.kind","kind",8 | 0);
      
      public static const TG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.tg","tg",16 | 2,StaticTuanGouModel);
      
      public static const TGR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.tgr","tgr",24 | 2,StaticTuanGouRewardModel);
      
      public static const OATM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.oatm","oatm",32 | 2,StaticOpActivityTmModel);
      
      public static const ZPI:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.zpi","zpi",40 | 2,StaticZhuanPanItemModel);
      
      public static const ZPC:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.zpc","zpc",48 | 2,StaticZhuanPanCostModel);
      
      public static const ZPR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.zpr","zpr",56 | 2,StaticZhuanPanRewardModel);
      
      public static const ZPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.zps","zps",64 | 2,StaticZhuanPanShopModel);
      
      public static const ZPT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.zpt","zpt",72 | 2,StaticZhuanPanTimeModel);
      
      public static const LTL:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ltl","ltl",80 | 2,StaticLuckTreeLevelModel);
      
      public static const LTR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ltr","ltr",88 | 2,StaticLuckTreeRewardModel);
      
      public static const LTWR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ltwr","ltwr",96 | 2,StaticLuckTreeWorldRewardModel);
      
      public static const LTSR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ltsr","ltsr",104 | 2,StaticLuckTreeScoreRewardModel);
      
      public static const LTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.lts","lts",112 | 2,StaticLuckTreeShopModel);
      
      public static const LTT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ltt","ltt",120 | 2,StaticLuckTreeTimeModel);
      
      public static const MSRR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.msrr","msrr",128 | 2,StaticMineSweepRankRewardModel);
      
      public static const MSRI:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.msri","msri",136 | 2,StaticMineSweepRewardItemModel);
      
      public static const MSO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.mso","mso",144 | 2,StaticMineSweepOpenModel);
      
      public static const MSP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.msp","msp",152 | 2,StaticMineSweepPriceModel);
      
      public static const FUND:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.fund","fund",160 | 2,StaticFundModel);
      
      public static const MSS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.mss","mss",168 | 2,StaticLuckTreeShopModel);
      
      public static const DBM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbm","dbm",184 | 2,StaticDragonBoatMakeModel);
      
      public static const DBP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbp","dbp",192 | 2,StaticDragonBoatPriceModel);
      
      public static const DBGM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbgm","dbgm",200 | 2,StaticDragonBoatGetMaterialModel);
      
      public static const DBRR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbrr","dbrr",208 | 2,StaticMineSweepRankRewardModel);
      
      public static const DBS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbs","dbs",216 | 2,StaticLuckTreeShopModel);
      
      public static const DBO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbo","dbo",224 | 2,StaticMineSweepOpenModel);
      
      public static const TOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.tower","tower",240 | 2,proto.StaticTowerModel);
      
      public static const OPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ops","ops",248 | 2,StaticOpActivity);
      
      public static const BDT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.bdt","bdt",800 | 2,StaticBuyDoubleTimeModel);
      
      public static const BDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.bds","bds",808 | 2,StaticBuyDoubleShopModel);
      
      public static const CRT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.crt","crt",816 | 2,StaticCharmRankTimeModel);
      
      public static const CRS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.crs","crs",824 | 2,StaticCharmRankShopModel);
      
      public static const CRA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.cra","cra",832 | 2,StaticCharmRankAwardModel);
      
      public static const GT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.gt","gt",840 | 2,StaticGoddesTimeModel);
      
      public static const GA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ga","ga",848 | 2,StaticGoddesAwardModel);
      
      public static const GD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.gd","gd",856 | 2,StaticGoddesDropModel);
      
      public static const CA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.ca","ca",864 | 2,StaticStartTmAndRoundModel);
      
      public static const FE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.fe","fe",872 | 2,StaticStartTmAndRoundModel);
      
      public static const TCA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.tca","tca",880 | 2,StaticStartTmAndRoundModel);
      
      public static const QUE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.que","que",888 | 2,proto.StaticQuestionModel);
      
      public static const DBD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("proto.OpActivityStatic.dbd","dbd",896 | 2,StaticGoddesDropModel);
       
      
      public var kind:Array;
      
      public var tg:Array;
      
      public var tgr:Array;
      
      public var oatm:Array;
      
      public var zpi:Array;
      
      public var zpc:Array;
      
      public var zpr:Array;
      
      public var zps:Array;
      
      public var zpt:Array;
      
      public var ltl:Array;
      
      public var ltr:Array;
      
      public var ltwr:Array;
      
      public var ltsr:Array;
      
      public var lts:Array;
      
      public var ltt:Array;
      
      public var msrr:Array;
      
      public var msri:Array;
      
      public var mso:Array;
      
      public var msp:Array;
      
      public var fund:Array;
      
      public var mss:Array;
      
      public var dbm:Array;
      
      public var dbp:Array;
      
      public var dbgm:Array;
      
      public var dbrr:Array;
      
      public var dbs:Array;
      
      public var dbo:Array;
      
      private var tower$field:proto.StaticTowerModel;
      
      public var ops:Array;
      
      public var bdt:Array;
      
      public var bds:Array;
      
      public var crt:Array;
      
      public var crs:Array;
      
      public var cra:Array;
      
      public var gt:Array;
      
      public var ga:Array;
      
      public var gd:Array;
      
      public var ca:Array;
      
      public var fe:Array;
      
      public var tca:Array;
      
      private var que$field:proto.StaticQuestionModel;
      
      public var dbd:Array;
      
      public function OpActivityStatic()
      {
         kind = [];
         tg = [];
         tgr = [];
         oatm = [];
         zpi = [];
         zpc = [];
         zpr = [];
         zps = [];
         zpt = [];
         ltl = [];
         ltr = [];
         ltwr = [];
         ltsr = [];
         lts = [];
         ltt = [];
         msrr = [];
         msri = [];
         mso = [];
         msp = [];
         fund = [];
         mss = [];
         dbm = [];
         dbp = [];
         dbgm = [];
         dbrr = [];
         dbs = [];
         dbo = [];
         ops = [];
         bdt = [];
         bds = [];
         crt = [];
         crs = [];
         cra = [];
         gt = [];
         ga = [];
         gd = [];
         ca = [];
         fe = [];
         tca = [];
         dbd = [];
         super();
      }
      
      public function clearTower() : void
      {
         tower$field = null;
      }
      
      public function get hasTower() : Boolean
      {
         return tower$field != null;
      }
      
      public function set tower(param1:proto.StaticTowerModel) : void
      {
         tower$field = param1;
      }
      
      public function get tower() : proto.StaticTowerModel
      {
         return tower$field;
      }
      
      public function clearQue() : void
      {
         que$field = null;
      }
      
      public function get hasQue() : Boolean
      {
         return que$field != null;
      }
      
      public function set que(param1:proto.StaticQuestionModel) : void
      {
         que$field = param1;
      }
      
      public function get que() : proto.StaticQuestionModel
      {
         return que$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc9_:* = 0;
         var _loc3_:* = 0;
         var _loc5_:* = 0;
         var _loc18_:* = 0;
         var _loc40_:* = 0;
         var _loc12_:* = 0;
         var _loc7_:* = 0;
         var _loc31_:* = 0;
         var _loc2_:* = 0;
         var _loc4_:* = 0;
         var _loc39_:* = 0;
         var _loc25_:* = 0;
         var _loc42_:* = 0;
         var _loc15_:* = 0;
         var _loc21_:* = 0;
         var _loc29_:* = 0;
         var _loc34_:* = 0;
         var _loc23_:* = 0;
         var _loc38_:* = 0;
         var _loc22_:* = 0;
         var _loc26_:* = 0;
         var _loc37_:* = 0;
         var _loc32_:* = 0;
         var _loc27_:* = 0;
         var _loc14_:* = 0;
         var _loc16_:* = 0;
         var _loc6_:* = 0;
         var _loc10_:* = 0;
         var _loc41_:* = 0;
         var _loc33_:* = 0;
         var _loc35_:* = 0;
         var _loc20_:* = 0;
         var _loc28_:* = 0;
         var _loc30_:* = 0;
         var _loc36_:* = 0;
         var _loc19_:* = 0;
         var _loc17_:* = 0;
         var _loc8_:* = 0;
         var _loc11_:* = 0;
         var _loc24_:* = 0;
         _loc9_ = uint(0);
         while(_loc9_ < this.kind.length)
         {
            WriteUtils.writeTag(param1,0,1);
            WriteUtils.write$TYPE_UINT32(param1,this.kind[_loc9_]);
            _loc9_++;
         }
         _loc3_ = uint(0);
         while(_loc3_ < this.tg.length)
         {
            WriteUtils.writeTag(param1,2,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tg[_loc3_]);
            _loc3_++;
         }
         _loc5_ = uint(0);
         while(_loc5_ < this.tgr.length)
         {
            WriteUtils.writeTag(param1,2,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tgr[_loc5_]);
            _loc5_++;
         }
         _loc18_ = uint(0);
         while(_loc18_ < this.oatm.length)
         {
            WriteUtils.writeTag(param1,2,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.oatm[_loc18_]);
            _loc18_++;
         }
         _loc40_ = uint(0);
         while(_loc40_ < this.zpi.length)
         {
            WriteUtils.writeTag(param1,2,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zpi[_loc40_]);
            _loc40_++;
         }
         _loc12_ = uint(0);
         while(_loc12_ < this.zpc.length)
         {
            WriteUtils.writeTag(param1,2,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zpc[_loc12_]);
            _loc12_++;
         }
         _loc7_ = uint(0);
         while(_loc7_ < this.zpr.length)
         {
            WriteUtils.writeTag(param1,2,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zpr[_loc7_]);
            _loc7_++;
         }
         _loc31_ = uint(0);
         while(_loc31_ < this.zps.length)
         {
            WriteUtils.writeTag(param1,2,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zps[_loc31_]);
            _loc31_++;
         }
         _loc2_ = uint(0);
         while(_loc2_ < this.zpt.length)
         {
            WriteUtils.writeTag(param1,2,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zpt[_loc2_]);
            _loc2_++;
         }
         _loc4_ = uint(0);
         while(_loc4_ < this.ltl.length)
         {
            WriteUtils.writeTag(param1,2,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ltl[_loc4_]);
            _loc4_++;
         }
         _loc39_ = uint(0);
         while(_loc39_ < this.ltr.length)
         {
            WriteUtils.writeTag(param1,2,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ltr[_loc39_]);
            _loc39_++;
         }
         _loc25_ = uint(0);
         while(_loc25_ < this.ltwr.length)
         {
            WriteUtils.writeTag(param1,2,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ltwr[_loc25_]);
            _loc25_++;
         }
         _loc42_ = uint(0);
         while(_loc42_ < this.ltsr.length)
         {
            WriteUtils.writeTag(param1,2,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ltsr[_loc42_]);
            _loc42_++;
         }
         _loc15_ = uint(0);
         while(_loc15_ < this.lts.length)
         {
            WriteUtils.writeTag(param1,2,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.lts[_loc15_]);
            _loc15_++;
         }
         _loc21_ = uint(0);
         while(_loc21_ < this.ltt.length)
         {
            WriteUtils.writeTag(param1,2,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ltt[_loc21_]);
            _loc21_++;
         }
         _loc29_ = uint(0);
         while(_loc29_ < this.msrr.length)
         {
            WriteUtils.writeTag(param1,2,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.msrr[_loc29_]);
            _loc29_++;
         }
         _loc34_ = uint(0);
         while(_loc34_ < this.msri.length)
         {
            WriteUtils.writeTag(param1,2,17);
            WriteUtils.write$TYPE_MESSAGE(param1,this.msri[_loc34_]);
            _loc34_++;
         }
         _loc23_ = uint(0);
         while(_loc23_ < this.mso.length)
         {
            WriteUtils.writeTag(param1,2,18);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mso[_loc23_]);
            _loc23_++;
         }
         _loc38_ = uint(0);
         while(_loc38_ < this.msp.length)
         {
            WriteUtils.writeTag(param1,2,19);
            WriteUtils.write$TYPE_MESSAGE(param1,this.msp[_loc38_]);
            _loc38_++;
         }
         _loc22_ = uint(0);
         while(_loc22_ < this.fund.length)
         {
            WriteUtils.writeTag(param1,2,20);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fund[_loc22_]);
            _loc22_++;
         }
         _loc26_ = uint(0);
         while(_loc26_ < this.mss.length)
         {
            WriteUtils.writeTag(param1,2,21);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mss[_loc26_]);
            _loc26_++;
         }
         _loc37_ = uint(0);
         while(_loc37_ < this.dbm.length)
         {
            WriteUtils.writeTag(param1,2,23);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbm[_loc37_]);
            _loc37_++;
         }
         _loc32_ = uint(0);
         while(_loc32_ < this.dbp.length)
         {
            WriteUtils.writeTag(param1,2,24);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbp[_loc32_]);
            _loc32_++;
         }
         _loc27_ = uint(0);
         while(_loc27_ < this.dbgm.length)
         {
            WriteUtils.writeTag(param1,2,25);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbgm[_loc27_]);
            _loc27_++;
         }
         _loc14_ = uint(0);
         while(_loc14_ < this.dbrr.length)
         {
            WriteUtils.writeTag(param1,2,26);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbrr[_loc14_]);
            _loc14_++;
         }
         _loc16_ = uint(0);
         while(_loc16_ < this.dbs.length)
         {
            WriteUtils.writeTag(param1,2,27);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbs[_loc16_]);
            _loc16_++;
         }
         _loc6_ = uint(0);
         while(_loc6_ < this.dbo.length)
         {
            WriteUtils.writeTag(param1,2,28);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbo[_loc6_]);
            _loc6_++;
         }
         if(hasTower)
         {
            WriteUtils.writeTag(param1,2,30);
            WriteUtils.write$TYPE_MESSAGE(param1,tower$field);
         }
         _loc10_ = uint(0);
         while(_loc10_ < this.ops.length)
         {
            WriteUtils.writeTag(param1,2,31);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ops[_loc10_]);
            _loc10_++;
         }
         _loc41_ = uint(0);
         while(_loc41_ < this.bdt.length)
         {
            WriteUtils.writeTag(param1,2,100);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bdt[_loc41_]);
            _loc41_++;
         }
         _loc33_ = uint(0);
         while(_loc33_ < this.bds.length)
         {
            WriteUtils.writeTag(param1,2,101);
            WriteUtils.write$TYPE_MESSAGE(param1,this.bds[_loc33_]);
            _loc33_++;
         }
         _loc35_ = uint(0);
         while(_loc35_ < this.crt.length)
         {
            WriteUtils.writeTag(param1,2,102);
            WriteUtils.write$TYPE_MESSAGE(param1,this.crt[_loc35_]);
            _loc35_++;
         }
         _loc20_ = uint(0);
         while(_loc20_ < this.crs.length)
         {
            WriteUtils.writeTag(param1,2,103);
            WriteUtils.write$TYPE_MESSAGE(param1,this.crs[_loc20_]);
            _loc20_++;
         }
         _loc28_ = uint(0);
         while(_loc28_ < this.cra.length)
         {
            WriteUtils.writeTag(param1,2,104);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cra[_loc28_]);
            _loc28_++;
         }
         _loc30_ = uint(0);
         while(_loc30_ < this.gt.length)
         {
            WriteUtils.writeTag(param1,2,105);
            WriteUtils.write$TYPE_MESSAGE(param1,this.gt[_loc30_]);
            _loc30_++;
         }
         _loc36_ = uint(0);
         while(_loc36_ < this.ga.length)
         {
            WriteUtils.writeTag(param1,2,106);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ga[_loc36_]);
            _loc36_++;
         }
         _loc19_ = uint(0);
         while(_loc19_ < this.gd.length)
         {
            WriteUtils.writeTag(param1,2,107);
            WriteUtils.write$TYPE_MESSAGE(param1,this.gd[_loc19_]);
            _loc19_++;
         }
         _loc17_ = uint(0);
         while(_loc17_ < this.ca.length)
         {
            WriteUtils.writeTag(param1,2,108);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ca[_loc17_]);
            _loc17_++;
         }
         _loc8_ = uint(0);
         while(_loc8_ < this.fe.length)
         {
            WriteUtils.writeTag(param1,2,109);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fe[_loc8_]);
            _loc8_++;
         }
         _loc11_ = uint(0);
         while(_loc11_ < this.tca.length)
         {
            WriteUtils.writeTag(param1,2,110);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tca[_loc11_]);
            _loc11_++;
         }
         if(hasQue)
         {
            WriteUtils.writeTag(param1,2,111);
            WriteUtils.write$TYPE_MESSAGE(param1,que$field);
         }
         _loc24_ = uint(0);
         while(_loc24_ < this.dbd.length)
         {
            WriteUtils.writeTag(param1,2,112);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dbd[_loc24_]);
            _loc24_++;
         }
         var _loc44_:int = 0;
         var _loc43_:* = this;
         for(var _loc13_ in this)
         {
            super.writeUnknown(param1,_loc13_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:* = 0;
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = uint(ReadUtils.read$TYPE_UINT32(param1));
            var _loc6_:* = _loc4_ >> 3;
            if(1 !== _loc6_)
            {
               if(2 !== _loc6_)
               {
                  if(3 !== _loc6_)
                  {
                     if(4 !== _loc6_)
                     {
                        if(5 !== _loc6_)
                        {
                           if(6 !== _loc6_)
                           {
                              if(7 !== _loc6_)
                              {
                                 if(8 !== _loc6_)
                                 {
                                    if(9 !== _loc6_)
                                    {
                                       if(10 !== _loc6_)
                                       {
                                          if(11 !== _loc6_)
                                          {
                                             if(12 !== _loc6_)
                                             {
                                                if(13 !== _loc6_)
                                                {
                                                   if(14 !== _loc6_)
                                                   {
                                                      if(15 !== _loc6_)
                                                      {
                                                         if(16 !== _loc6_)
                                                         {
                                                            if(17 !== _loc6_)
                                                            {
                                                               if(18 !== _loc6_)
                                                               {
                                                                  if(19 !== _loc6_)
                                                                  {
                                                                     if(20 !== _loc6_)
                                                                     {
                                                                        if(21 !== _loc6_)
                                                                        {
                                                                           if(23 !== _loc6_)
                                                                           {
                                                                              if(24 !== _loc6_)
                                                                              {
                                                                                 if(25 !== _loc6_)
                                                                                 {
                                                                                    if(26 !== _loc6_)
                                                                                    {
                                                                                       if(27 !== _loc6_)
                                                                                       {
                                                                                          if(28 !== _loc6_)
                                                                                          {
                                                                                             if(30 !== _loc6_)
                                                                                             {
                                                                                                if(31 !== _loc6_)
                                                                                                {
                                                                                                   if(100 !== _loc6_)
                                                                                                   {
                                                                                                      if(101 !== _loc6_)
                                                                                                      {
                                                                                                         if(102 !== _loc6_)
                                                                                                         {
                                                                                                            if(103 !== _loc6_)
                                                                                                            {
                                                                                                               if(104 !== _loc6_)
                                                                                                               {
                                                                                                                  if(105 !== _loc6_)
                                                                                                                  {
                                                                                                                     if(106 !== _loc6_)
                                                                                                                     {
                                                                                                                        if(107 !== _loc6_)
                                                                                                                        {
                                                                                                                           if(108 !== _loc6_)
                                                                                                                           {
                                                                                                                              if(109 !== _loc6_)
                                                                                                                              {
                                                                                                                                 if(110 !== _loc6_)
                                                                                                                                 {
                                                                                                                                    if(111 !== _loc6_)
                                                                                                                                    {
                                                                                                                                       if(112 !== _loc6_)
                                                                                                                                       {
                                                                                                                                          super.readUnknown(param1,_loc4_);
                                                                                                                                       }
                                                                                                                                       else
                                                                                                                                       {
                                                                                                                                          this.dbd.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesDropModel()));
                                                                                                                                       }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                       if(_loc3_ != 0)
                                                                                                                                       {
                                                                                                                                          throw new IOError("Bad data format: OpActivityStatic.que cannot be set twice.");
                                                                                                                                       }
                                                                                                                                       _loc3_++;
                                                                                                                                       this.que = new proto.StaticQuestionModel();
                                                                                                                                       ReadUtils.read$TYPE_MESSAGE(param1,this.que);
                                                                                                                                    }
                                                                                                                                 }
                                                                                                                                 else
                                                                                                                                 {
                                                                                                                                    this.tca.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticStartTmAndRoundModel()));
                                                                                                                                 }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                 this.fe.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticStartTmAndRoundModel()));
                                                                                                                              }
                                                                                                                           }
                                                                                                                           else
                                                                                                                           {
                                                                                                                              this.ca.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticStartTmAndRoundModel()));
                                                                                                                           }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                           this.gd.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesDropModel()));
                                                                                                                        }
                                                                                                                     }
                                                                                                                     else
                                                                                                                     {
                                                                                                                        this.ga.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesAwardModel()));
                                                                                                                     }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                     this.gt.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticGoddesTimeModel()));
                                                                                                                  }
                                                                                                               }
                                                                                                               else
                                                                                                               {
                                                                                                                  this.cra.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticCharmRankAwardModel()));
                                                                                                               }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                               this.crs.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticCharmRankShopModel()));
                                                                                                            }
                                                                                                         }
                                                                                                         else
                                                                                                         {
                                                                                                            this.crt.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticCharmRankTimeModel()));
                                                                                                         }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                         this.bds.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticBuyDoubleShopModel()));
                                                                                                      }
                                                                                                   }
                                                                                                   else
                                                                                                   {
                                                                                                      this.bdt.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticBuyDoubleTimeModel()));
                                                                                                   }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                   this.ops.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticOpActivity()));
                                                                                                }
                                                                                             }
                                                                                             else
                                                                                             {
                                                                                                if(_loc5_ != 0)
                                                                                                {
                                                                                                   throw new IOError("Bad data format: OpActivityStatic.tower cannot be set twice.");
                                                                                                }
                                                                                                _loc5_++;
                                                                                                this.tower = new proto.StaticTowerModel();
                                                                                                ReadUtils.read$TYPE_MESSAGE(param1,this.tower);
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             this.dbo.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepOpenModel()));
                                                                                          }
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          this.dbs.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeShopModel()));
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       this.dbrr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepRankRewardModel()));
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    this.dbgm.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticDragonBoatGetMaterialModel()));
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 this.dbp.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticDragonBoatPriceModel()));
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              this.dbm.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticDragonBoatMakeModel()));
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           this.mss.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeShopModel()));
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        this.fund.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticFundModel()));
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     this.msp.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepPriceModel()));
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  this.mso.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepOpenModel()));
                                                               }
                                                            }
                                                            else
                                                            {
                                                               this.msri.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepRewardItemModel()));
                                                            }
                                                         }
                                                         else
                                                         {
                                                            this.msrr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticMineSweepRankRewardModel()));
                                                         }
                                                      }
                                                      else
                                                      {
                                                         this.ltt.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeTimeModel()));
                                                      }
                                                   }
                                                   else
                                                   {
                                                      this.lts.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeShopModel()));
                                                   }
                                                }
                                                else
                                                {
                                                   this.ltsr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeScoreRewardModel()));
                                                }
                                             }
                                             else
                                             {
                                                this.ltwr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeWorldRewardModel()));
                                             }
                                          }
                                          else
                                          {
                                             this.ltr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeRewardModel()));
                                          }
                                       }
                                       else
                                       {
                                          this.ltl.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticLuckTreeLevelModel()));
                                       }
                                    }
                                    else
                                    {
                                       this.zpt.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticZhuanPanTimeModel()));
                                    }
                                 }
                                 else
                                 {
                                    this.zps.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticZhuanPanShopModel()));
                                 }
                              }
                              else
                              {
                                 this.zpr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticZhuanPanRewardModel()));
                              }
                           }
                           else
                           {
                              this.zpc.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticZhuanPanCostModel()));
                           }
                        }
                        else
                        {
                           this.zpi.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticZhuanPanItemModel()));
                        }
                     }
                     else
                     {
                        this.oatm.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticOpActivityTmModel()));
                     }
                  }
                  else
                  {
                     this.tgr.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticTuanGouRewardModel()));
                  }
               }
               else
               {
                  this.tg.push(ReadUtils.read$TYPE_MESSAGE(param1,new StaticTuanGouModel()));
               }
            }
            else if((_loc4_ & 7) == 2)
            {
               ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.kind);
            }
            else
            {
               this.kind.push(ReadUtils.read$TYPE_UINT32(param1));
            }
         }
      }
   }
}
