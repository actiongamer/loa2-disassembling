package com.netease.protobuf.fieldDescriptors
{
   import com.netease.protobuf.FieldDescriptor;
   import flash.utils.IDataInput;
   import com.netease.protobuf.ReadUtils;
   import com.netease.protobuf.WritingBuffer;
   import com.netease.protobuf.WriteUtils;
   
   public final class FieldDescriptor$TYPE_STRING extends FieldDescriptor
   {
       
      
      public function FieldDescriptor$TYPE_STRING(param1:String, param2:String, param3:uint)
      {
         super();
         this.fullName = param1;
         this.name = param2;
         this.tag = param3;
      }
      
      override public function get type() : Class
      {
         return String;
      }
      
      override public function readSingleField(param1:IDataInput) : *
      {
         return ReadUtils.read$TYPE_STRING(param1);
      }
      
      override public function writeSingleField(param1:WritingBuffer, param2:*) : void
      {
         WriteUtils.write$TYPE_STRING(param1,param2);
      }
   }
}
