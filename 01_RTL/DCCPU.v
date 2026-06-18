// Total execution cycles = 77015 cycles

// 6ns 335303.439810

module DCCPU (
    // Input
    clk,
    rst_n,
    // Output
    stall_1,
    stall_2,
    //===== AXI-4 Instruction1 DRAM =====
    arid_m_inf_inst_1,
    araddr_m_inf_inst_1,
    arlen_m_inf_inst_1,
    arsize_m_inf_inst_1,
    arburst_m_inf_inst_1,
    arvalid_m_inf_inst_1,
    arready_m_inf_inst_1,

    rid_m_inf_inst_1,
    rdata_m_inf_inst_1,
    rresp_m_inf_inst_1,
    rlast_m_inf_inst_1,
    rvalid_m_inf_inst_1,
    rready_m_inf_inst_1,

    //===== AXI-4 Instruction2 DRAM =====
    arid_m_inf_inst_2,
    araddr_m_inf_inst_2,
    arlen_m_inf_inst_2,
    arsize_m_inf_inst_2,
    arburst_m_inf_inst_2,
    arvalid_m_inf_inst_2,
    arready_m_inf_inst_2,

    rid_m_inf_inst_2,
    rdata_m_inf_inst_2,
    rresp_m_inf_inst_2,
    rlast_m_inf_inst_2,
    rvalid_m_inf_inst_2,
    rready_m_inf_inst_2,

    //===== AXI-4 Data DRAM =====
    arid_m_inf_data,
    araddr_m_inf_data,
    arlen_m_inf_data,
    arsize_m_inf_data,
    arburst_m_inf_data,
    arvalid_m_inf_data,
    arready_m_inf_data,

    rid_m_inf_data,
    rdata_m_inf_data,
    rresp_m_inf_data,
    rlast_m_inf_data,
    rvalid_m_inf_data,
    rready_m_inf_data,

    awid_m_inf_data,
    awaddr_m_inf_data,
    awsize_m_inf_data,
    awburst_m_inf_data,
    awlen_m_inf_data,
    awvalid_m_inf_data,
    awready_m_inf_data,

    wdata_m_inf_data,
    wlast_m_inf_data,
    wvalid_m_inf_data,
    wready_m_inf_data,

    bid_m_inf_data,
    bresp_m_inf_data,
    bvalid_m_inf_data,
    bready_m_inf_data
);
    // Input port
    input wire clk, rst_n;
    // Output port
    output reg stall_1, stall_2;

    parameter ID_WIDTH = 4, ADDR_WIDTH = 32, DATA_WIDTH = 16, BURST_LEN = 7;

    // AXI Interface wire connecttion for pseudo-DRAM read/write
    /* Hint:
  your AXI-4 interface could be designed as convertor in submodule(which used reg for output signal),
  therefore I declared output of AXI as wire in CPU
*/

    //########################################### Instruction1 DRAM
    // axi read addr channel 
    // src master
    output wire [ID_WIDTH-1:0] arid_m_inf_inst_1;
    output wire [ADDR_WIDTH-1:0] araddr_m_inf_inst_1;
    output wire [BURST_LEN-1:0] arlen_m_inf_inst_1;
    output wire [2:0] arsize_m_inf_inst_1;
    output wire [1:0] arburst_m_inf_inst_1;
    output wire arvalid_m_inf_inst_1;
    // src slave
    input wire arready_m_inf_inst_1;
    // ------------------------

    // axi read data channel 
    // slave
    input wire [ID_WIDTH-1:0] rid_m_inf_inst_1;
    input wire [DATA_WIDTH-1:0] rdata_m_inf_inst_1;
    input wire [1:0] rresp_m_inf_inst_1;
    input wire rlast_m_inf_inst_1;
    input wire rvalid_m_inf_inst_1;
    // master
    output wire rready_m_inf_inst_1;
    // -----------------------------

    //########################################### Instruction2 DRAM
    // axi read addr channel 
    // src master
    output wire [ID_WIDTH-1:0] arid_m_inf_inst_2;
    output wire [ADDR_WIDTH-1:0] araddr_m_inf_inst_2;
    output wire [BURST_LEN-1:0] arlen_m_inf_inst_2;
    output wire [2:0] arsize_m_inf_inst_2;
    output wire [1:0] arburst_m_inf_inst_2;
    output wire arvalid_m_inf_inst_2;
    // src slave
    input wire arready_m_inf_inst_2;
    // ------------------------

    // axi read data channel 
    // slave
    input wire [ID_WIDTH-1:0] rid_m_inf_inst_2;
    input wire [DATA_WIDTH-1:0] rdata_m_inf_inst_2;
    input wire [1:0] rresp_m_inf_inst_2;
    input wire rlast_m_inf_inst_2;
    input wire rvalid_m_inf_inst_2;
    // master
    output wire rready_m_inf_inst_2;
    // -----------------------------

    //########################################### Data DRAM 
    // axi write addr channel 
    // src master
    output wire [ID_WIDTH-1:0] awid_m_inf_data;
    output wire [ADDR_WIDTH-1:0] awaddr_m_inf_data;
    output wire [2:0] awsize_m_inf_data;
    output wire [1:0] awburst_m_inf_data;
    output wire [BURST_LEN-1:0] awlen_m_inf_data;
    output wire awvalid_m_inf_data;
    // src slave
    input wire awready_m_inf_data;
    // -------------------------

    // axi write data channel 
    // src master
    output wire [DATA_WIDTH-1:0] wdata_m_inf_data;
    output wire wlast_m_inf_data;
    output wire wvalid_m_inf_data;
    // src slave
    input wire wready_m_inf_data;

    // axi write resp channel 
    // src slave
    input wire [ID_WIDTH-1:0] bid_m_inf_data;
    input wire [1:0] bresp_m_inf_data;
    input wire bvalid_m_inf_data;
    // src master 
    output wire bready_m_inf_data;
    // ------------------------

    // axi read addr channel 
    // src master
    output wire [ID_WIDTH-1:0] arid_m_inf_data;
    output wire [ADDR_WIDTH-1:0] araddr_m_inf_data;
    output wire [BURST_LEN-1:0] arlen_m_inf_data;
    output wire [2:0] arsize_m_inf_data;
    output wire [1:0] arburst_m_inf_data;
    output wire arvalid_m_inf_data;
    // src slave
    input wire arready_m_inf_data;
    // ------------------------

    // axi read data channel 
    // slave
    input wire [ID_WIDTH-1:0] rid_m_inf_data;
    input wire [DATA_WIDTH-1:0] rdata_m_inf_data;
    input wire [1:0] rresp_m_inf_data;
    input wire rlast_m_inf_data;
    input wire rvalid_m_inf_data;
    // master
    output wire rready_m_inf_data;
    // -----------------------------
    //
    //
    // 
    /* Register in each core:
  There are sixteen registers in your CPU. You should not change the name of those registers.
  TA will check the value in each register when your core is not busy.
  Keep the register names below unchanged for PATTERN access.
*/
    reg [15:0] core_1_r0, core_1_r1, core_1_r2, core_1_r3;
    reg [15:0] core_1_r4, core_1_r5, core_1_r6, core_1_r7;
    reg [15:0] core_2_r0, core_2_r1, core_2_r2, core_2_r3;
    reg [15:0] core_2_r4, core_2_r5, core_2_r6, core_2_r7;

    // -----------------------------

    //##################################################
    //
    // Wrtie down your design below
    //
    //##################################################

    reg [12:0] prog_counter_1, prog_counter_2;

    localparam IC_NORMAL = 2'd0;
    localparam IC_AR_REQ = 2'd1;
    localparam IC_R_FILL = 2'd2;
    reg [1:0] inst_cache1_state, next_inst_cache1_state;
    reg [1:0] inst_cache2_state, next_inst_cache2_state;

    localparam NORMAL = 2'd0;
    localparam MISS_FILL = 2'd1;
    localparam WRITE_THROUGH = 2'd2;
    localparam DATA_READ_ARLEN = 7'd63;

    reg [1:0] state, next_state;

    reg inst_cache1_valid, inst_cache2_valid;
    reg [5:0] inst_cache1_tag_reg, inst_cache2_tag_reg;
    reg [5:0] inst_cache1_fill_cnt, inst_cache2_fill_cnt;
    wire [5:0] inst_cache1_tag = prog_counter_1[12:7];

    wire [5:0] inst_cache2_tag = prog_counter_2[12:7];

    wire inst_cache1_hit = inst_cache1_valid && (inst_cache1_tag_reg == inst_cache1_tag);
    wire inst_cache1_miss = !inst_cache1_hit;
    wire inst_cache2_hit = inst_cache2_valid && (inst_cache2_tag_reg == inst_cache2_tag);
    wire inst_cache2_miss = !inst_cache2_hit;

    always @(*) begin
        next_inst_cache1_state = inst_cache1_state;
        case (inst_cache1_state)
            IC_NORMAL: if (inst_cache1_miss) next_inst_cache1_state = IC_AR_REQ;
            IC_AR_REQ:
            if (arvalid_m_inf_inst_1 && arready_m_inf_inst_1) next_inst_cache1_state = IC_R_FILL;
            IC_R_FILL:
            if (rvalid_m_inf_inst_1 && rready_m_inf_inst_1 && rlast_m_inf_inst_1)
                next_inst_cache1_state = IC_NORMAL;
        endcase
    end

    always @(*) begin
        next_inst_cache2_state = inst_cache2_state;
        case (inst_cache2_state)
            IC_NORMAL: if (inst_cache2_miss) next_inst_cache2_state = IC_AR_REQ;
            IC_AR_REQ:
            if (arvalid_m_inf_inst_2 && arready_m_inf_inst_2) next_inst_cache2_state = IC_R_FILL;
            IC_R_FILL:
            if (rvalid_m_inf_inst_2 && rready_m_inf_inst_2 && rlast_m_inf_inst_2)
                next_inst_cache2_state = IC_NORMAL;
        endcase
    end

    reg [12:7] inst_cache1_miss_address_reg;
    reg [12:7] inst_cache2_miss_address_reg;

    wire miss_addr_gclk_en = (inst_cache1_state == IC_NORMAL && inst_cache1_miss) ||
                             (inst_cache2_state == IC_NORMAL && inst_cache2_miss);
    wire miss_addr_gclk;
    reg miss_addr_gclk_lat;
    always @(*) begin
        if (!clk) miss_addr_gclk_lat = miss_addr_gclk_en || !rst_n;
    end
    assign miss_addr_gclk = clk & miss_addr_gclk_lat;

    always @(posedge miss_addr_gclk or negedge rst_n) begin
        if (!rst_n) begin
            inst_cache1_miss_address_reg <= 6'd0;
            inst_cache2_miss_address_reg <= 6'd0;
        end else begin
            if (inst_cache1_state == IC_NORMAL && inst_cache1_miss)
                inst_cache1_miss_address_reg <= prog_counter_1[12:7];
            if (inst_cache2_state == IC_NORMAL && inst_cache2_miss)
                inst_cache2_miss_address_reg <= prog_counter_2[12:7];
        end
    end

    wire [5:0] inst_cache1_fill_tag = inst_cache1_miss_address_reg;
    wire [5:0] inst_cache2_fill_tag = inst_cache2_miss_address_reg;
    wire inst_cache1_fill_beat = (inst_cache1_state == IC_R_FILL) && rvalid_m_inf_inst_1 && rready_m_inf_inst_1;
    wire inst_cache2_fill_beat = (inst_cache2_state == IC_R_FILL) && rvalid_m_inf_inst_2 && rready_m_inf_inst_2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            inst_cache1_state <= IC_NORMAL;
            inst_cache2_state <= IC_NORMAL;
            inst_cache1_fill_cnt <= 6'd0;
            inst_cache2_fill_cnt <= 6'd0;
            inst_cache1_valid <= 1'b0;
            inst_cache2_valid <= 1'b0;
            inst_cache1_tag_reg <= 6'd0;
            inst_cache2_tag_reg <= 6'd0;
        end else begin
            if (inst_cache1_state != next_inst_cache1_state)
                inst_cache1_state <= next_inst_cache1_state;
            if (inst_cache2_state != next_inst_cache2_state)
                inst_cache2_state <= next_inst_cache2_state;
            if (inst_cache1_fill_beat) begin
                inst_cache1_fill_cnt <= inst_cache1_fill_cnt + 6'd1;
                if (rlast_m_inf_inst_1) begin
                    inst_cache1_valid   <= 1'b1;
                    inst_cache1_tag_reg <= inst_cache1_fill_tag;
                end
            end else if (inst_cache1_state == IC_NORMAL) inst_cache1_fill_cnt <= 6'd0;

            if (inst_cache2_fill_beat) begin
                inst_cache2_fill_cnt <= inst_cache2_fill_cnt + 6'd1;
                if (rlast_m_inf_inst_2) begin
                    inst_cache2_valid   <= 1'b1;
                    inst_cache2_tag_reg <= inst_cache2_fill_tag;
                end
            end else if (inst_cache2_state == IC_NORMAL) inst_cache2_fill_cnt <= 6'd0;
        end
    end

    assign arid_m_inf_inst_1 = 4'd0;
    assign arsize_m_inf_inst_1 = 3'b001;
    assign arburst_m_inf_inst_1 = 2'b01;
    assign arlen_m_inf_inst_1 = 7'd63;
    assign arvalid_m_inf_inst_1 = (inst_cache1_state == IC_AR_REQ);
    assign araddr_m_inf_inst_1 = {19'd0, inst_cache1_miss_address_reg, 7'd0};
    assign rready_m_inf_inst_1 = (inst_cache1_state == IC_R_FILL);

    assign arid_m_inf_inst_2 = 4'd0;
    assign arsize_m_inf_inst_2 = 3'b001;
    assign arburst_m_inf_inst_2 = 2'b01;
    assign arlen_m_inf_inst_2 = 7'd63;
    assign arvalid_m_inf_inst_2 = (inst_cache2_state == IC_AR_REQ);
    assign araddr_m_inf_inst_2 = {19'd0, inst_cache2_miss_address_reg, 7'd0};
    assign rready_m_inf_inst_2 = (inst_cache2_state == IC_R_FILL);

    wire inst_cache1_sram_we = inst_cache1_fill_beat;
    wire [15:0] inst_cache1_sram_rdata;
    wire inst_cache2_sram_we = inst_cache2_fill_beat;
    wire [15:0] inst_cache2_sram_rdata;

    wire icache1_wait_read;
    wire icache2_wait_read;
    reg inst_cache1_miss_recover, inst_cache2_miss_recover;

    wire core1_done, core2_done;
    wire core1_flush, core2_flush;
    wire sync_stall_1, sync_stall_2;

    reg  [3:0] multiplier_counter;
    reg        mult_running;
    wire       mult_finish;
    wire       core1_mult_stall_req;
    wire       core2_mult_stall_req;
    reg signed [15:0] shared_mult_in_a, shared_mult_in_b;
    reg         [31:0] product_reg;
    reg         [15:0] multiplicand;
    reg                booth_bit;
    reg                mult_owner;
    wire               mult_start;
    wire        [ 2:0] booth_window;
    reg signed  [17:0] partial_product;
    wire signed [17:0] upper_half = mult_running ? $signed(product_reg[31:16]) : 18'sd0;
    wire signed [17:0] next_upper = upper_half + partial_product;
    wire        [31:0] core1_mult_out;
    wire        [31:0] core2_mult_out;

    // ===== Manual Clock Gating: Multiplier =====
    wire mult_gclk_en = mult_start || mult_running;
    wire mult_gclk;
    reg  mult_gclk_lat;
    always @(*) begin
        if (!clk) mult_gclk_lat = mult_gclk_en || !rst_n;
    end
    assign mult_gclk = clk & mult_gclk_lat;

    reg fetch_valid_1, fetch_valid_2;
    reg [12:0] prog_counter_1_if2, prog_counter_2_if2;

    reg [15:0] instruction_reg1_reg, instruction_reg2_reg;
    reg [12:0] prog_counter_1_ex, prog_counter_2_ex;
    reg [12:0] core1_pc_plus_2_ex;
    reg [12:0] core2_pc_plus_2_ex;
    reg instruction_reg1_valid, instruction_reg2_valid;

    wire [15:0] instruction_reg1 = instruction_reg1_reg;
    wire [15:0] instruction_reg2 = instruction_reg2_reg;

    wire [2:0] core1_opcode = instruction_reg1[15:13];
    wire [2:0] core1_source_reg_idx = instruction_reg1[12:10], core1_target_reg_idx = instruction_reg1[9:7];
    wire [2:0] core1_dest_reg_idx = instruction_reg1[6:4], core1_func = instruction_reg1[3:1], core1_low_reg_idx = instruction_reg1[3:1];
    wire signed [15:0] core1_immediate_ext = {{9{instruction_reg1[6]}}, instruction_reg1[6:0]};
    wire [12:0] core1_jump_addr = instruction_reg1[12:0];

    wire core1_is_R = (core1_opcode == 3'b000);
    wire core1_is_MULT = (core1_opcode == 3'b001);
    wire core1_is_ADDI = (core1_opcode == 3'b010);
    wire core1_is_SUBI = (core1_opcode == 3'b011);
    wire core1_is_LOAD = (core1_opcode == 3'b100);
    wire core1_is_STOR = (core1_opcode == 3'b101);
    wire core1_is_BEQ = (core1_opcode == 3'b110);
    wire core1_is_JUMP = (core1_opcode == 3'b111);

    reg signed [15:0] core1_source_reg_val, core1_target_reg_val;
    always @(*) begin
        case (core1_source_reg_idx)
            3'd0: core1_source_reg_val = core_1_r0;
            3'd1: core1_source_reg_val = core_1_r1;
            3'd2: core1_source_reg_val = core_1_r2;
            3'd3: core1_source_reg_val = core_1_r3;
            3'd4: core1_source_reg_val = core_1_r4;
            3'd5: core1_source_reg_val = core_1_r5;
            3'd6: core1_source_reg_val = core_1_r6;
            3'd7: core1_source_reg_val = core_1_r7;
        endcase
        case (core1_target_reg_idx)
            3'd0: core1_target_reg_val = core_1_r0;
            3'd1: core1_target_reg_val = core_1_r1;
            3'd2: core1_target_reg_val = core_1_r2;
            3'd3: core1_target_reg_val = core_1_r3;
            3'd4: core1_target_reg_val = core_1_r4;
            3'd5: core1_target_reg_val = core_1_r5;
            3'd6: core1_target_reg_val = core_1_r6;
            3'd7: core1_target_reg_val = core_1_r7;
        endcase
    end

    wire [2:0] core2_opcode = instruction_reg2[15:13];
    wire [2:0]  core2_source_reg_idx = instruction_reg2[12:10], core2_target_reg_idx = instruction_reg2[9:7];
    wire [2:0]  core2_dest_reg_idx = instruction_reg2[6:4],   core2_func   = instruction_reg2[3:1], core2_low_reg_idx = instruction_reg2[3:1];
    wire signed [15:0] core2_immediate_ext = {{9{instruction_reg2[6]}}, instruction_reg2[6:0]};
    wire [12:0] core2_jump_addr = instruction_reg2[12:0];

    wire core2_is_R = (core2_opcode == 3'b000);
    wire core2_is_MULT = (core2_opcode == 3'b001);
    wire core2_is_ADDI = (core2_opcode == 3'b010);
    wire core2_is_SUBI = (core2_opcode == 3'b011);
    wire core2_is_LOAD = (core2_opcode == 3'b100);
    wire core2_is_STOR = (core2_opcode == 3'b101);
    wire core2_is_BEQ = (core2_opcode == 3'b110);
    wire core2_is_JUMP = (core2_opcode == 3'b111);

    reg signed [15:0] core2_source_reg_val, core2_target_reg_val;
    always @(*) begin
        case (core2_source_reg_idx)
            3'd0: core2_source_reg_val = core_2_r0;
            3'd1: core2_source_reg_val = core_2_r1;
            3'd2: core2_source_reg_val = core_2_r2;
            3'd3: core2_source_reg_val = core_2_r3;
            3'd4: core2_source_reg_val = core_2_r4;
            3'd5: core2_source_reg_val = core_2_r5;
            3'd6: core2_source_reg_val = core_2_r6;
            3'd7: core2_source_reg_val = core_2_r7;
        endcase
        case (core2_target_reg_idx)
            3'd0: core2_target_reg_val = core_2_r0;
            3'd1: core2_target_reg_val = core_2_r1;
            3'd2: core2_target_reg_val = core_2_r2;
            3'd3: core2_target_reg_val = core_2_r3;
            3'd4: core2_target_reg_val = core_2_r4;
            3'd5: core2_target_reg_val = core_2_r5;
            3'd6: core2_target_reg_val = core_2_r6;
            3'd7: core2_target_reg_val = core_2_r7;
        endcase
    end

    reg signed [1:0] inst_cache_diff;
    wire inst_cache_equal = (inst_cache_diff == 2'd0);
    wire core2_ahead = inst_cache_diff[1];
    wire core1_ahead = (!inst_cache_diff[1] && !inst_cache_equal);

    assign sync_stall_1 = core1_ahead;
    assign sync_stall_2 = core2_ahead;

    wire core1_active = instruction_reg1_valid && !sync_stall_1;
    wire core2_active = instruction_reg2_valid && !sync_stall_2;

    assign mult_finish = (mult_running && multiplier_counter == 4'd8);

    assign core1_mult_stall_req = (core1_is_MULT && core1_active) && !(mult_finish && mult_owner == 1'b0);
    assign core2_mult_stall_req = (core2_is_MULT && core2_active) && !(mult_finish && mult_owner == 1'b1);

    always @(*) begin
        if (core1_is_MULT && core1_active) begin
            shared_mult_in_a = core1_source_reg_val;
            shared_mult_in_b = core1_target_reg_val;
        end else if (core2_is_MULT && core2_active) begin
            shared_mult_in_a = core2_source_reg_val;
            shared_mult_in_b = core2_target_reg_val;
        end else begin
            shared_mult_in_a = 16'sd0;
            shared_mult_in_b = 16'sd0;
        end
    end

    assign mult_start   = ((core1_is_MULT && core1_active) || (core2_is_MULT && core2_active)) && !mult_running;
    assign booth_window = {product_reg[1:0], booth_bit};

    always @(*) begin
        if (mult_running) begin
            case (booth_window)
                3'b001, 3'b010: partial_product = $signed({{2{multiplicand[15]}}, multiplicand});
                3'b101, 3'b110: partial_product = -$signed({{2{multiplicand[15]}}, multiplicand});
                3'b011: partial_product = $signed({{2{multiplicand[15]}}, multiplicand}) <<< 1;
                3'b100: partial_product = -$signed({{2{multiplicand[15]}}, multiplicand}) <<< 1;
                default: partial_product = 18'sd0;
            endcase
        end else begin
            partial_product = 18'sd0;
        end
    end

    always @(posedge mult_gclk or negedge rst_n) begin
        if (!rst_n) begin
            multiplier_counter <= 4'd0;
            mult_running       <= 1'b0;
            product_reg        <= 32'd0;
            multiplicand       <= 16'd0;
            booth_bit          <= 1'b0;
            mult_owner         <= 1'b0;
        end else begin
            if (mult_start) begin
                mult_running       <= 1'b1;
                multiplier_counter <= 4'd0;
                product_reg        <= {16'd0, shared_mult_in_b};
                multiplicand       <= shared_mult_in_a;
                booth_bit          <= 1'b0;
                mult_owner         <= (core1_is_MULT && core1_active) ? 1'b0 : 1'b1;
            end else if (mult_running) begin
                if (multiplier_counter == 4'd8) begin
                    mult_running <= 1'b0;
                end else begin
                    multiplier_counter    <= multiplier_counter + 4'd1;
                    product_reg <= {next_upper[17:0], product_reg[15:2]};
                    booth_bit   <= product_reg[1];
                end
            end
        end
    end

    assign core1_mult_out = product_reg;
    assign core2_mult_out = product_reg;

    reg signed [15:0] core1_alu_out, core2_alu_out;

    wire core1_mem_calc_en = core1_active && (core1_is_LOAD || core1_is_STOR);
    wire core2_mem_calc_en = core2_active && (core2_is_LOAD || core2_is_STOR);
    wire core1_branch_calc_en = core1_active && core1_is_BEQ;
    wire core2_branch_calc_en = core2_active && core2_is_BEQ;

    wire core1_is_sub_op = core1_is_SUBI || (core1_opcode == 3'b000 && (core1_func == 3'b001 || core1_func == 3'b111));
    wire core1_immediate_sel = core1_opcode[2] ^ core1_opcode[1];
    wire signed [15:0] core1_raw_op2 = core1_immediate_sel ? core1_immediate_ext : core1_target_reg_val;
    wire core1_alu_en = core1_active && (core1_is_R || core1_is_ADDI || core1_is_SUBI);
    wire signed [15:0] core1_adder_op_a = core1_alu_en ? core1_source_reg_val : 16'd0;
    wire signed [15:0] core1_adder_op_b_raw = core1_alu_en ? core1_raw_op2 : 16'd0;
    wire signed [15:0] core1_alu_input_b = core1_is_sub_op ? ~core1_adder_op_b_raw : core1_adder_op_b_raw;
    wire core1_alu_cin = core1_is_sub_op && core1_alu_en;

    wire core2_is_sub_op = core2_is_SUBI || (core2_opcode == 3'b000 && (core2_func == 3'b001 || core2_func == 3'b111));
    wire core2_immediate_sel = core2_opcode[2] ^ core2_opcode[1];
    wire signed [15:0] core2_raw_op2 = core2_immediate_sel ? core2_immediate_ext : core2_target_reg_val;
    wire core2_alu_en = core2_active && (core2_is_R || core2_is_ADDI || core2_is_SUBI);
    wire signed [15:0] core2_adder_op_a = core2_alu_en ? core2_source_reg_val : 16'd0;
    wire signed [15:0] core2_adder_op_b_raw = core2_alu_en ? core2_raw_op2 : 16'd0;
    wire signed [15:0] core2_alu_input_b = core2_is_sub_op ? ~core2_adder_op_b_raw : core2_adder_op_b_raw;
    wire core2_alu_cin = core2_is_sub_op && core2_alu_en;

    wire signed [16:0] core1_main_adder_result = {core1_adder_op_a[15], core1_adder_op_a} + {core1_alu_input_b[15], core1_alu_input_b} + core1_alu_cin;
    wire signed [16:0] core2_main_adder_result = {core2_adder_op_a[15], core2_adder_op_a} + {core2_alu_input_b[15], core2_alu_input_b} + core2_alu_cin;
    wire [11:0] core1_mem_src_iso = core1_mem_calc_en ? core1_source_reg_val[11:0] : 12'd0;
    wire [11:0] core1_mem_imm_iso = core1_mem_calc_en ? core1_immediate_ext[11:0] : 12'd0;
    wire [11:0] core1_mem_adder_result = core1_mem_src_iso + core1_mem_imm_iso;
    wire [11:0] core2_mem_src_iso = core2_mem_calc_en ? core2_source_reg_val[11:0] : 12'd0;
    wire [11:0] core2_mem_imm_iso = core2_mem_calc_en ? core2_immediate_ext[11:0] : 12'd0;
    wire [11:0] core2_mem_adder_result = core2_mem_src_iso + core2_mem_imm_iso;

    wire [15:0] core1_mem_addr = {
        2'b00,
        core1_mem_adder_result[11],
        ~core1_mem_adder_result[11],
        core1_mem_adder_result[10:0],
        1'b0
    };
    wire [15:0] core2_mem_addr = {
        2'b00,
        core2_mem_adder_result[11],
        ~core2_mem_adder_result[11],
        core2_mem_adder_result[10:0],
        1'b0
    };

    always @(*) begin
        core1_alu_out = 16'd0;
        case (core1_opcode)
            3'b000: begin
                case (core1_func)
                    3'b000, 3'b001: core1_alu_out = core1_main_adder_result[15:0];
                    3'b010: core1_alu_out = core1_source_reg_val & core1_target_reg_val;
                    3'b011: core1_alu_out = core1_source_reg_val | core1_target_reg_val;
                    3'b100: core1_alu_out = ~(core1_source_reg_val & core1_target_reg_val);
                    3'b101: core1_alu_out = ~(core1_source_reg_val | core1_target_reg_val);
                    3'b110: core1_alu_out = core1_source_reg_val ^ core1_target_reg_val;
                    3'b111: core1_alu_out = core1_main_adder_result[16] ? 16'd1 : 16'd0;
                endcase
            end
            3'b010, 3'b011: core1_alu_out = core1_main_adder_result[15:0];
            default: core1_alu_out = 16'd0;
        endcase
    end

    always @(*) begin
        core2_alu_out = 16'd0;
        case (core2_opcode)
            3'b000: begin
                case (core2_func)
                    3'b000, 3'b001: core2_alu_out = core2_main_adder_result[15:0];
                    3'b010: core2_alu_out = core2_source_reg_val & core2_target_reg_val;
                    3'b011: core2_alu_out = core2_source_reg_val | core2_target_reg_val;
                    3'b100: core2_alu_out = ~(core2_source_reg_val & core2_target_reg_val);
                    3'b101: core2_alu_out = ~(core2_source_reg_val | core2_target_reg_val);
                    3'b110: core2_alu_out = core2_source_reg_val ^ core2_target_reg_val;
                    3'b111: core2_alu_out = core2_main_adder_result[16] ? 16'd1 : 16'd0;
                endcase
            end
            3'b010, 3'b011: core2_alu_out = core2_main_adder_result[15:0];
            default: core2_alu_out = 16'd0;
        endcase
    end

    reg cache_just_filled;
    reg axi_aw_done, axi_w_done, axi_ar_done, axi_is_core2;
    reg write_resp_pending;
    reg write_bypass_core1_reg, write_bypass_core2_reg;
    reg [5:0] pending_write_idx_reg;
    reg [13:1] axi_addr_reg;
    reg [13:1] data_fill_base_reg;
    reg [5:0] data_fill_cnt;
    reg [15:0] axi_wdata_reg;
    reg [15:0] filled_data_reg;
    wire [15:0] data_sram_rdata_wire;
    reg [15:0] data_sram_rdata_reg;
    reg [15:0] data_sram_wdata_reg;
    reg [5:0] data_sram_addr_reg;
    reg data_sram_web_reg;
    reg data_sram_cs_reg;
    reg data_fill_write_enable_reg;
    reg data_sram_write_stage;
    reg data_read_pending;
    reg data_read_owner_core2;
    reg [1:0] data_read_wait_cnt;
    wire data_read_done = data_read_pending && (data_read_wait_cnt == 2'd2);
    wire data_read_retire = data_read_done && (data_read_owner_core2 ? !sync_stall_2 : !sync_stall_1);
    wire sram_busy = data_fill_write_enable_reg || data_sram_write_stage || data_read_pending;

    reg [63:0] data_cache_valid_array;
    reg [5:0] data_cache_tag_array[0:63];

    wire [15:0] core1_mem_wdata = core1_target_reg_val;
    wire core1_mem_read = core1_is_LOAD && core1_active;
    wire core1_mem_write = core1_is_STOR && core1_active;
    wire [15:0] core1_mem_rdata;

    wire [15:0] core2_mem_wdata = core2_target_reg_val;
    wire core2_mem_read = core2_is_LOAD && core2_active;
    wire core2_mem_write = core2_is_STOR && core2_active;
    wire [15:0] core2_mem_rdata;

    wire core1_req = instruction_reg1_valid && (core1_mem_read || core1_mem_write);
    wire core2_req = instruction_reg2_valid && (core2_mem_read || core2_mem_write);

    wire [5:0] core1_idx = core1_mem_calc_en ? core1_mem_addr[6:1] : 6'd0;
    wire [5:0] core1_tag = core1_mem_calc_en ? {core1_mem_addr[13], core1_mem_addr[11:7]} : 6'd0;
    wire [5:0] core2_idx = core2_mem_calc_en ? core2_mem_addr[6:1] : 6'd0;
    wire [5:0] core2_tag = core2_mem_calc_en ? {core2_mem_addr[13], core2_mem_addr[11:7]} : 6'd0;

    wire core1_hit = core1_mem_calc_en && data_cache_valid_array[core1_idx] && (data_cache_tag_array[core1_idx] == core1_tag);
    wire core2_hit = core2_mem_calc_en && data_cache_valid_array[core2_idx] && (data_cache_tag_array[core2_idx] == core2_tag);

    wire same_mem_addr = ((core1_mem_read || core1_mem_write) && (core2_mem_read || core2_mem_write)) ?
                         (core1_mem_adder_result == core2_mem_adder_result) : 1'b0;
    wire bypass_en    = same_mem_addr && core2_mem_write && core1_mem_read && (inst_cache_equal || core1_ahead);
    wire bypass_c2_en = same_mem_addr && core1_mem_write && core2_mem_read && (inst_cache_equal || core2_ahead);

    wire core2_write_issue = (state == NORMAL) && core2_req && core2_mem_write && !sram_busy && !write_resp_pending;
    wire core1_write_issue = (state == NORMAL) && core1_req && core1_mem_write && !sram_busy && !write_resp_pending && !core2_write_issue;
    wire cpu_write_enable = core1_write_issue || core2_write_issue;
    wire core2_read_miss_req = core2_req && core2_mem_read && !core2_hit && !sram_busy && !bypass_c2_en;
    wire core1_read_miss_req = core1_req && core1_mem_read && !core1_hit && !sram_busy && !bypass_en;
    wire core2_read_miss_allowed = (state == NORMAL) && !cpu_write_enable && core2_read_miss_req && !(write_resp_pending && (core2_idx == pending_write_idx_reg));
    wire core1_read_miss_allowed = (state == NORMAL) && !cpu_write_enable && core1_read_miss_req && !(write_resp_pending && (core1_idx == pending_write_idx_reg)) && !core2_read_miss_allowed;
    wire core2_read_miss_issue = core2_read_miss_allowed;
    wire core1_read_miss_issue = core1_read_miss_allowed;
    wire [13:1] data_read_miss_addr = core2_read_miss_issue ? core2_mem_addr[13:1] : core1_mem_addr[13:1];
    wire [13:1] data_read_miss_base = {data_read_miss_addr[13:7], 6'd0};
    wire core2_hit_read_req = (state == NORMAL) && core2_req && core2_mem_read && core2_hit && !sram_busy && !bypass_c2_en && !cache_just_filled;
    wire core1_hit_read_req = (state == NORMAL) && core1_req && core1_mem_read && core1_hit && !sram_busy && !bypass_en && !cache_just_filled;
    wire data_read_issue_core2 = !data_read_pending && !cpu_write_enable && core2_hit_read_req;
    wire data_read_issue_core1 = !data_read_pending && !cpu_write_enable && core1_hit_read_req && !core2_hit_read_req;
    wire data_read_issue = data_read_issue_core2 || data_read_issue_core1;

    wire axi_aw_hs = awvalid_m_inf_data && awready_m_inf_data;
    wire axi_w_hs = wvalid_m_inf_data && wready_m_inf_data;
    wire axi_aw_complete = axi_aw_done || axi_aw_hs;
    wire axi_w_complete = axi_w_done || axi_w_hs;
    wire axi_write_accepted = (state == WRITE_THROUGH) && axi_aw_complete && axi_w_complete;
    wire axi_write_success = (bvalid_m_inf_data && bready_m_inf_data);
    wire core1_write_bypass_active = write_bypass_core1_reg && axi_write_accepted && axi_is_core2;
    wire core2_write_bypass_active = write_bypass_core2_reg && axi_write_accepted && !axi_is_core2;

    assign core1_done = (!core1_req) ||
         (core1_mem_read && ((data_read_done && !data_read_owner_core2) ||
                             core1_write_bypass_active ||
                             (cache_just_filled && !axi_is_core2 && !bypass_en))) ||
         (core1_mem_write && (axi_write_accepted && !axi_is_core2));

    assign core2_done = (!core2_req) ||
         (core2_mem_read && ((data_read_done && data_read_owner_core2) ||
                             core2_write_bypass_active ||
                             (cache_just_filled && axi_is_core2 && !bypass_c2_en))) ||
         (core2_mem_write && (axi_write_accepted && axi_is_core2));

    wire dram_fill_beat = (state == MISS_FILL) && rvalid_m_inf_data && rready_m_inf_data;
    wire dram_fill_done = dram_fill_beat && rlast_m_inf_data;
    wire [5:0] data_fill_idx = data_fill_cnt;
    wire [5:0] data_fill_tag = {data_fill_base_reg[13], data_fill_base_reg[11:7]};
    wire data_fill_is_request = (data_fill_cnt == axi_addr_reg[6:1]);
    wire cache_fill_write_enable = dram_fill_beat && !(write_resp_pending && (data_fill_idx == pending_write_idx_reg));
    wire [15:0] cache_fill_data = rdata_m_inf_data;

    wire core1_ex_ready = (core1_req ? core1_done : 1'b1) && !sync_stall_1 && !core1_mult_stall_req;
    wire core2_ex_ready = (core2_req ? core2_done : 1'b1) && !sync_stall_2 && !core2_mult_stall_req;

    wire [15:0] core1_branch_cmp_a = core1_branch_calc_en ? core1_source_reg_val : 16'd0;
    wire [15:0] core1_branch_cmp_b = core1_branch_calc_en ? core1_target_reg_val : 16'd0;
    wire [15:0] core2_branch_cmp_a = core2_branch_calc_en ? core2_source_reg_val : 16'd0;
    wire [15:0] core2_branch_cmp_b = core2_branch_calc_en ? core2_target_reg_val : 16'd0;
    wire core1_beq_taken = core1_branch_calc_en && (core1_branch_cmp_a == core1_branch_cmp_b);
    wire core2_beq_taken = core2_branch_calc_en && (core2_branch_cmp_a == core2_branch_cmp_b);

    assign core1_flush = instruction_reg1_valid && (core1_is_JUMP || core1_beq_taken);
    assign core2_flush = instruction_reg2_valid && (core2_is_JUMP || core2_beq_taken);

    wire core1_step = core1_ex_ready && instruction_reg1_valid;
    wire core2_step = core2_ex_ready && instruction_reg2_valid;

    wire core1_is_alu = core1_is_R || core1_is_ADDI || core1_is_SUBI;
    wire core1_writeback_enable = core1_step && (core1_is_alu || (core1_is_LOAD && core1_done));
    wire [15:0] core1_writeback_data = core1_is_LOAD ? (core1_done ? core1_mem_rdata : 16'd0) : core1_alu_out;
    wire core1_writeback_to_r0 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd0) || (!core1_is_R && core1_target_reg_idx == 3'd0));
    wire core1_writeback_to_r1 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd1) || (!core1_is_R && core1_target_reg_idx == 3'd1));
    wire core1_writeback_to_r2 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd2) || (!core1_is_R && core1_target_reg_idx == 3'd2));
    wire core1_writeback_to_r3 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd3) || (!core1_is_R && core1_target_reg_idx == 3'd3));
    wire core1_writeback_to_r4 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd4) || (!core1_is_R && core1_target_reg_idx == 3'd4));
    wire core1_writeback_to_r5 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd5) || (!core1_is_R && core1_target_reg_idx == 3'd5));
    wire core1_writeback_to_r6 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd6) || (!core1_is_R && core1_target_reg_idx == 3'd6));
    wire core1_writeback_to_r7 = core1_writeback_enable && ((core1_is_R && core1_dest_reg_idx == 3'd7) || (!core1_is_R && core1_target_reg_idx == 3'd7));

    wire core2_is_alu = core2_is_R || core2_is_ADDI || core2_is_SUBI;
    wire core2_writeback_enable = core2_step && (core2_is_alu || (core2_is_LOAD && core2_done));
    wire [15:0] core2_writeback_data = core2_is_LOAD ? (core2_done ? core2_mem_rdata : 16'd0) : core2_alu_out;
    wire core2_writeback_to_r0 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd0) || (!core2_is_R && core2_target_reg_idx == 3'd0));
    wire core2_writeback_to_r1 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd1) || (!core2_is_R && core2_target_reg_idx == 3'd1));
    wire core2_writeback_to_r2 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd2) || (!core2_is_R && core2_target_reg_idx == 3'd2));
    wire core2_writeback_to_r3 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd3) || (!core2_is_R && core2_target_reg_idx == 3'd3));
    wire core2_writeback_to_r4 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd4) || (!core2_is_R && core2_target_reg_idx == 3'd4));
    wire core2_writeback_to_r5 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd5) || (!core2_is_R && core2_target_reg_idx == 3'd5));
    wire core2_writeback_to_r6 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd6) || (!core2_is_R && core2_target_reg_idx == 3'd6));
    wire core2_writeback_to_r7 = core2_writeback_enable && ((core2_is_R && core2_dest_reg_idx == 3'd7) || (!core2_is_R && core2_target_reg_idx == 3'd7));

    // ===== Manual Clock Gating: Core 1 Register File =====
    wire core1_reg_wr_en = (core1_is_MULT && core1_step) || core1_writeback_enable;
    wire core1_reg_gclk;
    reg  core1_reg_gclk_lat;
    always @(*) begin
        if (!clk) core1_reg_gclk_lat = core1_reg_wr_en || !rst_n;
    end
    assign core1_reg_gclk = clk & core1_reg_gclk_lat;

    // ===== Manual Clock Gating: Core 2 Register File =====
    wire core2_reg_wr_en = (core2_is_MULT && core2_step) || core2_writeback_enable;
    wire core2_reg_gclk;
    reg  core2_reg_gclk_lat;
    always @(*) begin
        if (!clk) core2_reg_gclk_lat = core2_reg_wr_en || !rst_n;
    end
    assign core2_reg_gclk = clk & core2_reg_gclk_lat;

    wire [12:0] core1_imm_addr_offset = core1_branch_calc_en ? {core1_immediate_ext[11:0], 1'b0} : 13'd0;
    wire [12:0] core1_branch_base_pc = core1_branch_calc_en ? core1_pc_plus_2_ex : 13'd0;
    wire [12:0] core1_branch_target = core1_branch_base_pc + core1_imm_addr_offset;

    assign icache1_wait_read = (inst_cache1_state != IC_NORMAL) || inst_cache1_miss || inst_cache1_miss_recover;
    assign icache2_wait_read = (inst_cache2_state != IC_NORMAL) || inst_cache2_miss || inst_cache2_miss_recover;

    wire [12:0] core1_next_pc = 
        (!core1_ex_ready)             ? prog_counter_1 :             
        (core1_flush && core1_is_JUMP)   ? core1_jump_addr :     
        (core1_flush && core1_is_BEQ)    ? core1_branch_target : 
        icache1_wait_read             ? prog_counter_1 :
                                     prog_counter_1 + 13'd2;

    wire [12:0] core2_imm_addr_offset = core2_branch_calc_en ? {core2_immediate_ext[11:0], 1'b0} : 13'd0;
    wire [12:0] core2_branch_base_pc = core2_branch_calc_en ? core2_pc_plus_2_ex : 13'd0;
    wire [12:0] core2_branch_target = core2_branch_base_pc + core2_imm_addr_offset;

    wire [12:0] core2_next_pc = 
        (!core2_ex_ready)             ? prog_counter_2 :             
        (core2_flush && core2_is_JUMP)   ? core2_jump_addr :     
        (core2_flush && core2_is_BEQ)    ? core2_branch_target : 
        icache2_wait_read             ? prog_counter_2 :
                                     prog_counter_2 + 13'd2;

    reg [15:0] core1_skid_data, core2_skid_data;
    reg [12:0] core1_skid_pc, core2_skid_pc;
    reg core1_skid_valid, core2_skid_valid;

    wire core1_skid_capture = !core1_ex_ready && !core1_skid_valid && fetch_valid_1;
    wire core2_skid_capture = !core2_ex_ready && !core2_skid_valid && fetch_valid_2;

    wire core1_skid_gclk_en = core1_skid_capture || (core1_ex_ready && core1_skid_valid);
    wire core1_skid_gclk;
    reg core1_skid_gclk_lat;
    always @(*) begin
        if (!clk) core1_skid_gclk_lat = core1_skid_gclk_en || !rst_n;
    end
    assign core1_skid_gclk = clk & core1_skid_gclk_lat;

    always @(posedge core1_skid_gclk or negedge rst_n) begin
        if (!rst_n) begin
            core1_skid_valid <= 1'b0;
            core1_skid_data  <= 16'd0;
            core1_skid_pc    <= 13'd0;
        end else begin
            if (core1_skid_capture) begin
                core1_skid_data  <= inst_cache1_sram_rdata;
                core1_skid_pc    <= prog_counter_1_if2;
                core1_skid_valid <= 1'b1;
            end else if (core1_ex_ready) begin
                core1_skid_valid <= 1'b0;
            end
        end
    end

    wire core2_skid_gclk_en = core2_skid_capture || (core2_ex_ready && core2_skid_valid);
    wire core2_skid_gclk;
    reg core2_skid_gclk_lat;
    always @(*) begin
        if (!clk) core2_skid_gclk_lat = core2_skid_gclk_en || !rst_n;
    end
    assign core2_skid_gclk = clk & core2_skid_gclk_lat;

    always @(posedge core2_skid_gclk or negedge rst_n) begin
        if (!rst_n) begin
            core2_skid_valid <= 1'b0;
            core2_skid_data  <= 16'd0;
            core2_skid_pc    <= 13'd0;
        end else begin
            if (core2_skid_capture) begin
                core2_skid_data  <= inst_cache2_sram_rdata;
                core2_skid_pc    <= prog_counter_2_if2;
                core2_skid_valid <= 1'b1;
            end else if (core2_ex_ready) begin
                core2_skid_valid <= 1'b0;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fetch_valid_1 <= 1'b0;
            prog_counter_1_if2 <= 13'd0;
            fetch_valid_2 <= 1'b0;
            prog_counter_2_if2 <= 13'd0;
            instruction_reg1_reg <= 16'd0;
            instruction_reg1_valid <= 1'b0;
            prog_counter_1_ex <= 13'd0;
            instruction_reg2_reg <= 16'd0;
            instruction_reg2_valid <= 1'b0;
            prog_counter_2_ex <= 13'd0;
            core1_pc_plus_2_ex <= 13'd0;
            core2_pc_plus_2_ex <= 13'd0;
        end else begin
            if (core1_ex_ready) begin
                if (core1_flush || icache1_wait_read) begin
                    fetch_valid_1 <= 1'b0;
                end else begin
                    fetch_valid_1      <= 1'b1;
                    prog_counter_1_if2 <= prog_counter_1;
                end

                if (core1_flush) begin
                    instruction_reg1_valid <= 1'b0;
                end else begin
                    if (core1_skid_valid) begin
                        instruction_reg1_reg   <= core1_skid_data;
                        instruction_reg1_valid <= 1'b1;
                        prog_counter_1_ex      <= core1_skid_pc;
                        core1_pc_plus_2_ex     <= core1_skid_pc + 13'd2;
                    end else begin
                        instruction_reg1_reg   <= inst_cache1_sram_rdata;
                        instruction_reg1_valid <= fetch_valid_1;
                        prog_counter_1_ex      <= prog_counter_1_if2;
                        core1_pc_plus_2_ex     <= prog_counter_1_if2 + 13'd2;
                    end
                end
            end

            if (core2_ex_ready) begin
                if (core2_flush || icache2_wait_read) begin
                    fetch_valid_2 <= 1'b0;
                end else begin
                    fetch_valid_2      <= 1'b1;
                    prog_counter_2_if2 <= prog_counter_2;
                end
                if (core2_flush) begin
                    instruction_reg2_valid <= 1'b0;
                    core2_pc_plus_2_ex <= 13'd0;
                end else begin
                    if (core2_skid_valid) begin
                        instruction_reg2_reg   <= core2_skid_data;
                        instruction_reg2_valid <= 1'b1;
                        prog_counter_2_ex      <= core2_skid_pc;
                        core2_pc_plus_2_ex     <= core2_skid_pc + 13'd2;
                    end else begin
                        instruction_reg2_reg   <= inst_cache2_sram_rdata;
                        instruction_reg2_valid <= fetch_valid_2;
                        prog_counter_2_ex      <= prog_counter_2_if2;
                        core2_pc_plus_2_ex     <= prog_counter_2_if2 + 13'd2;
                    end
                end
            end
        end
    end

    always @(*) begin
        next_state = state;
        case (state)
            NORMAL: begin
                if (core2_write_issue || core1_write_issue) begin
                    next_state = WRITE_THROUGH;
                end else if (core2_read_miss_issue || core1_read_miss_issue) begin
                    next_state = MISS_FILL;
                end
            end
            MISS_FILL: if (dram_fill_done) next_state = NORMAL;
            WRITE_THROUGH: if (axi_write_accepted) next_state = NORMAL;
            default: next_state = NORMAL;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= NORMAL;
            axi_addr_reg <= 13'd0;
            data_fill_base_reg <= 13'd0;
            axi_wdata_reg <= 16'd0;
            axi_is_core2 <= 1'b0;
            write_bypass_core1_reg <= 1'b0;
            write_bypass_core2_reg <= 1'b0;
        end else begin
            if (state != next_state) state <= next_state;
            if (state == NORMAL) begin
                write_bypass_core1_reg <= 1'b0;
                write_bypass_core2_reg <= 1'b0;
                if (core2_write_issue) begin
                    axi_addr_reg <= core2_mem_addr[13:1];
                    axi_wdata_reg <= core2_mem_wdata;
                    axi_is_core2 <= 1'b1;
                    write_bypass_core1_reg <= bypass_en;
                end else if (core1_write_issue) begin
                    axi_addr_reg <= core1_mem_addr[13:1];
                    axi_wdata_reg <= core1_mem_wdata;
                    axi_is_core2 <= 1'b0;
                    write_bypass_core2_reg <= bypass_c2_en;
                end else if (core2_read_miss_issue) begin
                    axi_addr_reg       <= data_read_miss_addr;
                    data_fill_base_reg <= data_read_miss_base;
                    axi_is_core2       <= 1'b1;
                end else if (core1_read_miss_issue) begin
                    axi_addr_reg       <= data_read_miss_addr;
                    data_fill_base_reg <= data_read_miss_base;
                    axi_is_core2       <= 1'b0;
                end
            end else if (axi_write_accepted) begin
                write_bypass_core1_reg <= 1'b0;
                write_bypass_core2_reg <= 1'b0;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            axi_aw_done <= 1'b0;
            axi_w_done <= 1'b0;
            axi_ar_done <= 1'b0;
            write_resp_pending <= 1'b0;
            pending_write_idx_reg <= 6'd0;
        end else begin
            if (axi_aw_hs) axi_aw_done <= 1'b1;
            if (axi_w_hs) axi_w_done <= 1'b1;
            if (axi_write_accepted) begin
                axi_aw_done <= 1'b0;
                axi_w_done  <= 1'b0;
            end
            if (axi_write_success) write_resp_pending <= 1'b0;
            else if (axi_write_accepted) begin
                write_resp_pending <= 1'b1;
                pending_write_idx_reg <= axi_addr_reg[6:1];
            end
            if (arvalid_m_inf_data && arready_m_inf_data) axi_ar_done <= 1'b1;
            if (state != MISS_FILL) axi_ar_done <= 1'b0;
        end
    end

    assign awid_m_inf_data = 0;
    assign arid_m_inf_data = 0;
    assign awsize_m_inf_data = 3'b001;
    assign awburst_m_inf_data = 2'b01;
    assign awlen_m_inf_data = 7'd0;
    assign arsize_m_inf_data = 3'b001;
    assign arburst_m_inf_data = 2'b01;
    assign arlen_m_inf_data = DATA_READ_ARLEN;

    assign awvalid_m_inf_data = (state == WRITE_THROUGH) && !axi_aw_done;
    assign awaddr_m_inf_data = {18'b0, axi_addr_reg[13:1], 1'b0};

    assign wvalid_m_inf_data = (state == WRITE_THROUGH) && !axi_w_done;
    assign wlast_m_inf_data = (state == WRITE_THROUGH) && !axi_w_done;
    assign wdata_m_inf_data = axi_wdata_reg;

    assign bready_m_inf_data = (state == WRITE_THROUGH) || write_resp_pending;

    assign arvalid_m_inf_data = (state == MISS_FILL) && !axi_ar_done;
    assign araddr_m_inf_data = {18'b0, data_fill_base_reg[13:1], 1'b0};
    assign rready_m_inf_data = (state == MISS_FILL) ? 1'b1 : 1'b0;

    wire inst_cache1_fill_done = inst_cache1_state == IC_R_FILL && rlast_m_inf_inst_1 && rvalid_m_inf_inst_1;
    wire inst_cache2_fill_done = inst_cache2_state == IC_R_FILL && rlast_m_inf_inst_2 && rvalid_m_inf_inst_2;

    wire icache_recover_gclk_en = inst_cache1_fill_done || inst_cache1_miss_recover ||
                                  inst_cache2_fill_done || inst_cache2_miss_recover;
    wire icache_recover_gclk;
    reg icache_recover_gclk_lat;
    always @(*) begin
        if (!clk) icache_recover_gclk_lat = icache_recover_gclk_en || !rst_n;
    end
    assign icache_recover_gclk = clk & icache_recover_gclk_lat;

    always @(posedge icache_recover_gclk or negedge rst_n) begin
        if (!rst_n) begin
            inst_cache1_miss_recover <= 1'b0;
            inst_cache2_miss_recover <= 1'b0;
        end else begin
            if (inst_cache1_fill_done) inst_cache1_miss_recover <= 1'b1;
            else inst_cache1_miss_recover <= 1'b0;

            if (inst_cache2_fill_done) inst_cache2_miss_recover <= 1'b1;
            else inst_cache2_miss_recover <= 1'b0;
        end
    end

    wire stall_1_next = ~core1_step;
    wire stall_2_next = ~core2_step;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            stall_1 <= 1'b1;
            stall_2 <= 1'b1;
        end else begin
            stall_1 <= stall_1_next;
            stall_2 <= stall_2_next;
        end
    end

    assign core1_mem_rdata = core1_write_bypass_active ? axi_wdata_reg : cache_just_filled ? filled_data_reg : data_sram_rdata_reg;
    assign core2_mem_rdata = core2_write_bypass_active ? axi_wdata_reg : cache_just_filled ? filled_data_reg : data_sram_rdata_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_fill_cnt <= 6'd0;
        end else begin
            if (state == NORMAL && (core2_read_miss_issue || core1_read_miss_issue)) begin
                data_fill_cnt <= 6'd0;
            end else if (dram_fill_beat) begin
                if (rlast_m_inf_data) data_fill_cnt <= 6'd0;
                else data_fill_cnt <= data_fill_cnt + 6'd1;
            end
        end
    end

    // cache_just_filled and filled_data_reg stay on normal clk (small, frequently checked)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cache_just_filled <= 1'b0;
            filled_data_reg <= 16'd0;
        end else begin
            if (dram_fill_beat && data_fill_is_request) filled_data_reg <= rdata_m_inf_data;
            if (dram_fill_done) begin
                cache_just_filled <= 1'b1;
            end else cache_just_filled <= 1'b0;
        end
    end

    // Data cache tag array and valid array
    integer i_tag;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_cache_valid_array <= 64'd0;
            for (i_tag = 0; i_tag < 64; i_tag = i_tag + 1) data_cache_tag_array[i_tag] <= 6'd0;
        end else begin
            if (cpu_write_enable) begin
                data_cache_valid_array[core2_write_issue?core2_idx : core1_idx] <= 1'b1;
                data_cache_tag_array[core2_write_issue ? core2_idx : core1_idx]   <= core2_write_issue ? core2_tag : core1_tag;
            end else if (cache_fill_write_enable) begin
                data_cache_valid_array[data_fill_cnt] <= 1'b1;
                data_cache_tag_array[data_fill_cnt]   <= data_fill_tag;
            end
        end
    end

    // PC and inst_cache_diff on normal clk
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            prog_counter_1 <= 13'd0;
            prog_counter_2 <= 13'd0;
            inst_cache_diff <= 2'd0;
        end else begin
            if (prog_counter_1 != core1_next_pc) prog_counter_1 <= core1_next_pc;
            if (prog_counter_2 != core2_next_pc) prog_counter_2 <= core2_next_pc;

            case ({
                core1_step, core2_step
            })
                2'b10: inst_cache_diff <= inst_cache_diff + 2'd1;
                2'b01: inst_cache_diff <= inst_cache_diff - 2'd1;
            endcase
        end
    end

    // Core 1 register file on gated clock
    always @(posedge core1_reg_gclk or negedge rst_n) begin
        if (!rst_n) begin
            core_1_r0 <= 16'd0;
            core_1_r1 <= 16'd0;
            core_1_r2 <= 16'd0;
            core_1_r3 <= 16'd0;
            core_1_r4 <= 16'd0;
            core_1_r5 <= 16'd0;
            core_1_r6 <= 16'd0;
            core_1_r7 <= 16'd0;
        end else begin
            if (core1_is_MULT) begin
                case (core1_dest_reg_idx)
                    3'd0: core_1_r0 <= core1_mult_out[31:16];
                    3'd1: core_1_r1 <= core1_mult_out[31:16];
                    3'd2: core_1_r2 <= core1_mult_out[31:16];
                    3'd3: core_1_r3 <= core1_mult_out[31:16];
                    3'd4: core_1_r4 <= core1_mult_out[31:16];
                    3'd5: core_1_r5 <= core1_mult_out[31:16];
                    3'd6: core_1_r6 <= core1_mult_out[31:16];
                    3'd7: core_1_r7 <= core1_mult_out[31:16];
                endcase
                case (core1_low_reg_idx)
                    3'd0: core_1_r0 <= core1_mult_out[15:0];
                    3'd1: core_1_r1 <= core1_mult_out[15:0];
                    3'd2: core_1_r2 <= core1_mult_out[15:0];
                    3'd3: core_1_r3 <= core1_mult_out[15:0];
                    3'd4: core_1_r4 <= core1_mult_out[15:0];
                    3'd5: core_1_r5 <= core1_mult_out[15:0];
                    3'd6: core_1_r6 <= core1_mult_out[15:0];
                    3'd7: core_1_r7 <= core1_mult_out[15:0];
                endcase
            end else begin
                if (core1_writeback_to_r0) core_1_r0 <= core1_writeback_data;
                if (core1_writeback_to_r1) core_1_r1 <= core1_writeback_data;
                if (core1_writeback_to_r2) core_1_r2 <= core1_writeback_data;
                if (core1_writeback_to_r3) core_1_r3 <= core1_writeback_data;
                if (core1_writeback_to_r4) core_1_r4 <= core1_writeback_data;
                if (core1_writeback_to_r5) core_1_r5 <= core1_writeback_data;
                if (core1_writeback_to_r6) core_1_r6 <= core1_writeback_data;
                if (core1_writeback_to_r7) core_1_r7 <= core1_writeback_data;
            end
        end
    end

    // Core 2 register file on gated clock
    always @(posedge core2_reg_gclk or negedge rst_n) begin
        if (!rst_n) begin
            core_2_r0 <= 16'd0;
            core_2_r1 <= 16'd0;
            core_2_r2 <= 16'd0;
            core_2_r3 <= 16'd0;
            core_2_r4 <= 16'd0;
            core_2_r5 <= 16'd0;
            core_2_r6 <= 16'd0;
            core_2_r7 <= 16'd0;
        end else begin
            if (core2_is_MULT) begin
                case (core2_dest_reg_idx)
                    3'd0: core_2_r0 <= core2_mult_out[31:16];
                    3'd1: core_2_r1 <= core2_mult_out[31:16];
                    3'd2: core_2_r2 <= core2_mult_out[31:16];
                    3'd3: core_2_r3 <= core2_mult_out[31:16];
                    3'd4: core_2_r4 <= core2_mult_out[31:16];
                    3'd5: core_2_r5 <= core2_mult_out[31:16];
                    3'd6: core_2_r6 <= core2_mult_out[31:16];
                    3'd7: core_2_r7 <= core2_mult_out[31:16];
                endcase
                case (core2_low_reg_idx)
                    3'd0: core_2_r0 <= core2_mult_out[15:0];
                    3'd1: core_2_r1 <= core2_mult_out[15:0];
                    3'd2: core_2_r2 <= core2_mult_out[15:0];
                    3'd3: core_2_r3 <= core2_mult_out[15:0];
                    3'd4: core_2_r4 <= core2_mult_out[15:0];
                    3'd5: core_2_r5 <= core2_mult_out[15:0];
                    3'd6: core_2_r6 <= core2_mult_out[15:0];
                    3'd7: core_2_r7 <= core2_mult_out[15:0];
                endcase
            end else begin
                if (core2_writeback_to_r0) core_2_r0 <= core2_writeback_data;
                if (core2_writeback_to_r1) core_2_r1 <= core2_writeback_data;
                if (core2_writeback_to_r2) core_2_r2 <= core2_writeback_data;
                if (core2_writeback_to_r3) core_2_r3 <= core2_writeback_data;
                if (core2_writeback_to_r4) core_2_r4 <= core2_writeback_data;
                if (core2_writeback_to_r5) core_2_r5 <= core2_writeback_data;
                if (core2_writeback_to_r6) core_2_r6 <= core2_writeback_data;
                if (core2_writeback_to_r7) core_2_r7 <= core2_writeback_data;
            end
        end
    end

    reg [15:0] data_fill_wdata_reg;
    reg [ 5:0] data_fill_waddr_reg;

    wire data_read_gclk_en = data_read_issue || data_read_pending;
    wire data_read_gclk;
    reg data_read_gclk_lat;
    always @(*) begin
        if (!clk) data_read_gclk_lat = data_read_gclk_en || !rst_n;
    end
    assign data_read_gclk = clk & data_read_gclk_lat;

    always @(posedge data_read_gclk or negedge rst_n) begin
        if (!rst_n) begin
            data_read_pending <= 1'b0;
            data_read_owner_core2 <= 1'b0;
            data_read_wait_cnt <= 2'd0;
        end else begin
            if (data_read_issue) begin
                data_read_pending <= 1'b1;
                data_read_owner_core2 <= data_read_issue_core2;
                data_read_wait_cnt <= 2'd0;
            end else if (data_read_pending) begin
                if (data_read_retire) begin
                    data_read_pending  <= 1'b0;
                    data_read_wait_cnt <= 2'd0;
                end else if (!data_read_done) begin
                    data_read_wait_cnt <= data_read_wait_cnt + 2'd1;
                end
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_fill_write_enable_reg <= 1'b0;
            data_fill_wdata_reg <= 16'd0;
            data_fill_waddr_reg <= 6'd0;
        end else begin
            data_fill_write_enable_reg <= cache_fill_write_enable;
            if (cache_fill_write_enable) begin
                data_fill_wdata_reg <= cache_fill_data;
                data_fill_waddr_reg <= data_fill_cnt;
            end
        end
    end

    wire final_data_sram_we = cpu_write_enable || data_fill_write_enable_reg;
    wire [15:0] final_data_sram_wdata = data_fill_write_enable_reg ? data_fill_wdata_reg : 
                                        (core2_write_issue ? core2_mem_wdata : core1_mem_wdata);
    wire data_sram_we_next = final_data_sram_we;
    wire data_sram_cs_next = final_data_sram_we || data_read_issue;

    wire core2_addr_sel = core2_write_issue || data_read_issue_core2;
    wire [5:0] data_sram_addr_next =
        data_fill_write_enable_reg ? data_fill_waddr_reg :
        core2_addr_sel ? core2_idx : core1_idx;

    wire [15:0] data_sram_wdata_next = final_data_sram_wdata;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_sram_cs_reg <= 1'b0;
            data_sram_web_reg <= 1'b1;
            data_sram_addr_reg <= 6'd0;
            data_sram_wdata_reg <= 16'd0;
            data_sram_write_stage <= 1'b0;
            data_sram_rdata_reg <= 16'd0;
        end else begin
            data_sram_cs_reg <= data_sram_cs_next;
            if (data_sram_cs_next) begin
                data_sram_web_reg  <= ~data_sram_we_next;
                data_sram_addr_reg <= data_sram_addr_next;
                if (data_sram_we_next) data_sram_wdata_reg <= data_sram_wdata_next;
            end else begin
                data_sram_web_reg <= 1'b1;
            end
            data_sram_write_stage <= data_sram_we_next;
            if (data_read_pending) data_sram_rdata_reg <= data_sram_rdata_wire;
        end
    end

    SRAM_DATA_64x16 data_sram (
        .A0  (data_sram_addr_reg[0]),
        .A1  (data_sram_addr_reg[1]),
        .A2  (data_sram_addr_reg[2]),
        .A3  (data_sram_addr_reg[3]),
        .A4  (data_sram_addr_reg[4]),
        .A5  (data_sram_addr_reg[5]),
        .DO0 (data_sram_rdata_wire[0]),
        .DO1 (data_sram_rdata_wire[1]),
        .DO2 (data_sram_rdata_wire[2]),
        .DO3 (data_sram_rdata_wire[3]),
        .DO4 (data_sram_rdata_wire[4]),
        .DO5 (data_sram_rdata_wire[5]),
        .DO6 (data_sram_rdata_wire[6]),
        .DO7 (data_sram_rdata_wire[7]),
        .DO8 (data_sram_rdata_wire[8]),
        .DO9 (data_sram_rdata_wire[9]),
        .DO10(data_sram_rdata_wire[10]),
        .DO11(data_sram_rdata_wire[11]),
        .DO12(data_sram_rdata_wire[12]),
        .DO13(data_sram_rdata_wire[13]),
        .DO14(data_sram_rdata_wire[14]),
        .DO15(data_sram_rdata_wire[15]),
        .DI0 (data_sram_wdata_reg[0]),
        .DI1 (data_sram_wdata_reg[1]),
        .DI2 (data_sram_wdata_reg[2]),
        .DI3 (data_sram_wdata_reg[3]),
        .DI4 (data_sram_wdata_reg[4]),
        .DI5 (data_sram_wdata_reg[5]),
        .DI6 (data_sram_wdata_reg[6]),
        .DI7 (data_sram_wdata_reg[7]),
        .DI8 (data_sram_wdata_reg[8]),
        .DI9 (data_sram_wdata_reg[9]),
        .DI10(data_sram_wdata_reg[10]),
        .DI11(data_sram_wdata_reg[11]),
        .DI12(data_sram_wdata_reg[12]),
        .DI13(data_sram_wdata_reg[13]),
        .DI14(data_sram_wdata_reg[14]),
        .DI15(data_sram_wdata_reg[15]),
        .CK  (clk),
        .WEB (data_sram_web_reg),
        .OE  (1'b1),
        .CS  (data_sram_cs_reg)
    );

    wire icache1_sram_cs;
    wire icache1_sram_cs_next;
    reg  icache1_sram_cs_reg;
    reg  inst_cache1_we_reg;
    assign icache1_sram_cs = icache1_sram_cs_reg;
    assign icache1_sram_cs_next = 
           inst_cache1_sram_we ||
           ((inst_cache1_state == IC_NORMAL) && !inst_cache1_miss && !(core1_skid_valid && !core1_ex_ready));

    wire icache2_sram_cs;
    wire icache2_sram_cs_next;
    reg  icache2_sram_cs_reg;
    reg  inst_cache2_we_reg;
    assign icache2_sram_cs = icache2_sram_cs_reg;
    assign icache2_sram_cs_next = 
           inst_cache2_sram_we ||
           ((inst_cache2_state == IC_NORMAL) && !inst_cache2_miss && !(core2_skid_valid && !core2_ex_ready));

    reg [15:0] inst_cache1_rdata_reg;
    reg [5:0] inst_cache1_waddr_reg;

    reg inst_cache1_web_reg_sram;

    wire [ 5:0] inst_cache1_sram_addr = (inst_cache1_state == IC_R_FILL) ? inst_cache1_fill_cnt : prog_counter_1[6:1];

    reg [5:0] final_ic1_sram_addr_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            final_ic1_sram_addr_reg <= 6'd0;
        end else begin
            if (inst_cache1_sram_we) begin
                final_ic1_sram_addr_reg <= inst_cache1_sram_addr;
            end else begin
                final_ic1_sram_addr_reg <= core1_next_pc[6:1];
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            icache1_sram_cs_reg      <= 1'b0;
            inst_cache1_we_reg       <= 1'b0;
            inst_cache1_web_reg_sram <= 1'b1;
            inst_cache1_rdata_reg    <= 16'd0;
            inst_cache1_waddr_reg    <= 6'd0;
        end else begin
            icache1_sram_cs_reg <= icache1_sram_cs_next;
            inst_cache1_we_reg  <= inst_cache1_sram_we;
            if (inst_cache1_sram_we) begin
                inst_cache1_web_reg_sram <= 1'b0;
                inst_cache1_rdata_reg    <= rdata_m_inf_inst_1;
                inst_cache1_waddr_reg    <= inst_cache1_sram_addr;
            end else begin
                inst_cache1_web_reg_sram <= 1'b1;
            end
        end
    end

    SRAM_ICACHE1_64x16 icache1_sram (
        .A0  (final_ic1_sram_addr_reg[0]),
        .A1  (final_ic1_sram_addr_reg[1]),
        .A2  (final_ic1_sram_addr_reg[2]),
        .A3  (final_ic1_sram_addr_reg[3]),
        .A4  (final_ic1_sram_addr_reg[4]),
        .A5  (final_ic1_sram_addr_reg[5]),
        .DO0 (inst_cache1_sram_rdata[0]),
        .DO1 (inst_cache1_sram_rdata[1]),
        .DO2 (inst_cache1_sram_rdata[2]),
        .DO3 (inst_cache1_sram_rdata[3]),
        .DO4 (inst_cache1_sram_rdata[4]),
        .DO5 (inst_cache1_sram_rdata[5]),
        .DO6 (inst_cache1_sram_rdata[6]),
        .DO7 (inst_cache1_sram_rdata[7]),
        .DO8 (inst_cache1_sram_rdata[8]),
        .DO9 (inst_cache1_sram_rdata[9]),
        .DO10(inst_cache1_sram_rdata[10]),
        .DO11(inst_cache1_sram_rdata[11]),
        .DO12(inst_cache1_sram_rdata[12]),
        .DO13(inst_cache1_sram_rdata[13]),
        .DO14(inst_cache1_sram_rdata[14]),
        .DO15(inst_cache1_sram_rdata[15]),
        .DI0 (inst_cache1_rdata_reg[0]),
        .DI1 (inst_cache1_rdata_reg[1]),
        .DI2 (inst_cache1_rdata_reg[2]),
        .DI3 (inst_cache1_rdata_reg[3]),
        .DI4 (inst_cache1_rdata_reg[4]),
        .DI5 (inst_cache1_rdata_reg[5]),
        .DI6 (inst_cache1_rdata_reg[6]),
        .DI7 (inst_cache1_rdata_reg[7]),
        .DI8 (inst_cache1_rdata_reg[8]),
        .DI9 (inst_cache1_rdata_reg[9]),
        .DI10(inst_cache1_rdata_reg[10]),
        .DI11(inst_cache1_rdata_reg[11]),
        .DI12(inst_cache1_rdata_reg[12]),
        .DI13(inst_cache1_rdata_reg[13]),
        .DI14(inst_cache1_rdata_reg[14]),
        .DI15(inst_cache1_rdata_reg[15]),
        .CK  (clk),
        .WEB (inst_cache1_web_reg_sram),
        .OE  (1'b1),
        .CS  (icache1_sram_cs)
    );

    reg [15:0] inst_cache2_rdata_reg;
    reg [5:0] inst_cache2_waddr_reg;

    reg inst_cache2_web_reg_sram;

    wire [ 5:0] inst_cache2_sram_addr = (inst_cache2_state == IC_R_FILL) ? inst_cache2_fill_cnt : prog_counter_2[6:1];

    reg [5:0] final_ic2_sram_addr_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            final_ic2_sram_addr_reg <= 6'd0;
        end else begin
            if (inst_cache2_sram_we) begin
                final_ic2_sram_addr_reg <= inst_cache2_sram_addr;
            end else begin
                final_ic2_sram_addr_reg <= core2_next_pc[6:1];
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            icache2_sram_cs_reg      <= 1'b0;
            inst_cache2_we_reg       <= 1'b0;
            inst_cache2_web_reg_sram <= 1'b1;
            inst_cache2_rdata_reg    <= 16'd0;
            inst_cache2_waddr_reg    <= 6'd0;
        end else begin
            icache2_sram_cs_reg <= icache2_sram_cs_next;
            inst_cache2_we_reg  <= inst_cache2_sram_we;
            if (inst_cache2_sram_we) begin
                inst_cache2_web_reg_sram <= 1'b0;
                inst_cache2_rdata_reg    <= rdata_m_inf_inst_2;
                inst_cache2_waddr_reg    <= inst_cache2_sram_addr;
            end else begin
                inst_cache2_web_reg_sram <= 1'b1;
            end
        end
    end

    SRAM_ICACHE2_64x16 icache2_sram (
        .A0  (final_ic2_sram_addr_reg[0]),
        .A1  (final_ic2_sram_addr_reg[1]),
        .A2  (final_ic2_sram_addr_reg[2]),
        .A3  (final_ic2_sram_addr_reg[3]),
        .A4  (final_ic2_sram_addr_reg[4]),
        .A5  (final_ic2_sram_addr_reg[5]),
        .DO0 (inst_cache2_sram_rdata[0]),
        .DO1 (inst_cache2_sram_rdata[1]),
        .DO2 (inst_cache2_sram_rdata[2]),
        .DO3 (inst_cache2_sram_rdata[3]),
        .DO4 (inst_cache2_sram_rdata[4]),
        .DO5 (inst_cache2_sram_rdata[5]),
        .DO6 (inst_cache2_sram_rdata[6]),
        .DO7 (inst_cache2_sram_rdata[7]),
        .DO8 (inst_cache2_sram_rdata[8]),
        .DO9 (inst_cache2_sram_rdata[9]),
        .DO10(inst_cache2_sram_rdata[10]),
        .DO11(inst_cache2_sram_rdata[11]),
        .DO12(inst_cache2_sram_rdata[12]),
        .DO13(inst_cache2_sram_rdata[13]),
        .DO14(inst_cache2_sram_rdata[14]),
        .DO15(inst_cache2_sram_rdata[15]),
        .DI0 (inst_cache2_rdata_reg[0]),
        .DI1 (inst_cache2_rdata_reg[1]),
        .DI2 (inst_cache2_rdata_reg[2]),
        .DI3 (inst_cache2_rdata_reg[3]),
        .DI4 (inst_cache2_rdata_reg[4]),
        .DI5 (inst_cache2_rdata_reg[5]),
        .DI6 (inst_cache2_rdata_reg[6]),
        .DI7 (inst_cache2_rdata_reg[7]),
        .DI8 (inst_cache2_rdata_reg[8]),
        .DI9 (inst_cache2_rdata_reg[9]),
        .DI10(inst_cache2_rdata_reg[10]),
        .DI11(inst_cache2_rdata_reg[11]),
        .DI12(inst_cache2_rdata_reg[12]),
        .DI13(inst_cache2_rdata_reg[13]),
        .DI14(inst_cache2_rdata_reg[14]),
        .DI15(inst_cache2_rdata_reg[15]),
        .CK  (clk),
        .WEB (inst_cache2_web_reg_sram),
        .OE  (1'b1),
        .CS  (icache2_sram_cs)
    );

endmodule
