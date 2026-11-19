Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112163;
	b=5dIcMmCebReKcXjYRe2kVpPGfWV5atjZVK4oYof0NR4buOIwEpAkdhWaNAP6+4971f/V
	 /JJB2heSgPp0t2MF3NdabUNVeYB4wy97B05NcfLDO42s3/xp7SY8z5kHj1/RjgoU2uP56
	 sDBZkpvD/qvpEDzFE36yuS17UujH2YLTUkgWMdWkDRFmBnQ4vnU1473T0YQ/Q70OJ/H8f
	 AEzPlD4yQan7Z3g+6+jnC1Gl/sGeFHcCDajz4dB01xyVlhrdtbcfuJ2vkapCqeAGB4PlS
	 riGNhjRLLRBkFHQQG+DhImAqu+BUYhapBMXt4LhEDwYP3ZVzrQbt8QaHLdTGiJHqRpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=9xWyza1krbc1HJO2YHE3Az4YUKhVCKp9RFZz+xhoHQ8=;
	b=uELjkDVGTFdO1D0uIXHLdeU9++8WFpvWAFTJZVPYy6sv3IigMcyHdSTl6Svhos9cTZ+t
	 qep6gu3MhvXBOUTs1di5snMZ3jGMXz9s6KsSMY6k/JT+GoPsCC3whc7PKC7CPsFZOTOzj
	 KiDDMUEA882ZRnhUnR2ATsdyxgRsfreebQ6T91tzBuN4g0e7njGP0g9LDN0aXaODwGynb
	 Rt7cGlrxwD59udX/aosWa6dDVSl96Hy5yHPWBZ31H9u/8FoP1Q60oeU26gklA/L4bvsVX
	 iXmujetY5MKQ0SmdQd3nryaRbUcLMzWiTusotZN4w5fKGB2GPJs2c9grL7t8xen2ekA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVIfGwd6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061C606A324
	for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 18:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9061C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VVIfGwd6
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-705cb6ceebaso15625eaf.3
        for <io-uring@vger.kernel.org>; Thu, 19 Nov 2026 10:16:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795112161; cv=none;
        d=google.com; s=arc-20260327;
        b=obctkg32UG0Y0X9lEwhKZIzZZUYjXCfkrnlEIfSZm0SIIppCGzpQVp+ns7z31xY/Oy
         vS0ddpLjs8R749rm98VAl4TJL7vm+qgkXANZ6H5RMwyDn8C8yn2QdQYlLHIx92uv37Aq
         nsYjqsb1lDD++qmBTFXdDlpPr+BLzoxbOwRWiB34DqyAADdnbvyOo6+vSDoYNXP+ZcU1
         hlo7f+XBZjWa4BpU0iaeHW5dSVvMQ7FxMH35PHdsH0Pq2rZzD6/cnwmLDn9khv9XIfqS
         LUnyg91x3iT9QlYQ3ywIPYeX8MQzlT38jK5MtPusqcPXrstxaqDzSkK8vT/wMAeiTdDp
         5UdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9xWyza1krbc1HJO2YHE3Az4YUKhVCKp9RFZz+xhoHQ8=;
        fh=xl+ghTUEqOpeXJstfIsbZTjwVjCtZrM1Rg5O9auJ2jE=;
        b=mHxiUW7vEXDaawQLX5RTyTI1CnVp9kG/QrR27mzWo514lKuCymZLjhU/kf7BuUrTnM
         liqcr9iOB+KRFCoKQIPZWeWaSX1L39XNHF6gsIpq9HmS/5kGHNJ9kePLTmGQUFrrVQGR
         2Vf3cG1Lz41b9MbsyuH+pqTaCVkyRAPk2TNsKGvuV3sHe/yc91rN/dtLUdkFtSr4LH1q
         lBWrDgIrXVIHhEgOWIBhSQfaXyvL/g+qdVgPwSNhInchytuoCA1ZHf5vsbcTqAYc98ho
         jSganb+eAhkdQi1+gaD7OVlLixkF2h2uxteH0rOWNOjxJi21N1CY0O7N0Vw/0cHBEmBa
         9U2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795112161; x=1795716961; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xWyza1krbc1HJO2YHE3Az4YUKhVCKp9RFZz+xhoHQ8=;
        b=VVIfGwd6EyO3PiCEw85QR6QuRmnDjUIFyk4JaAb0P+TjGnmGlIpar6PBi3xkkDIUQ0
         ZhjZ6VZpxzsqAFQ6foZUx5vk2HY+HZKuM1PtgWDyre4elME1AQeQyh6m8vBnOfs22HT6
         z4SqrgkoY/l2e84IOlyf1UhOBYVQQAh4LqsKmI8Rv9w4QMDtLBXhgpZut/j3YMQ+hSur
         ayB4lm9vnD9dabLfc0jGNvLBzc2sjggKA52m8/9mf0G0x7A3X1/pkqTTtpkKWRiT9UBT
         82nkFcIhbIZcPge3CE0psE9EDwzNa+wfWofHrGkGW10u4nOr0XI+1Fu7/Mlfl32L2JwP
         iuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112161; x=1795716961;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9xWyza1krbc1HJO2YHE3Az4YUKhVCKp9RFZz+xhoHQ8=;
        b=GEy3O3jTq4u/PHRxiEYVOmFJGXtpOFH4yknbUeBZwtTnros2l1nzndCEwUI3RwFV+v
         UV9y4lYDBrun65EaEZnuyCvJdUTy2ZDHGMoj46KnjqTp1Z6Xg/R4JjwxE66yEULaRkBb
         1TyNSwZJw55r5J1TRPGl/W9CFE/aP+/PuYiS2z0zWmSlbJh8cCvSYORU9L/6NhABX9AP
         NIc6NdGahrBheEIUpVBV+eCe2PhZVHWFoM+c5Nf5sGbCzY1EOnnzCMiRUOZFRV+MCzqx
         5A6vItGoUltYAfWXOJ4wuzKIcejwCwU9YC+aw+WECEWhI+K7lOH9j0WpDDmQIuIk0N0c
         ACcg==
X-Gm-Message-State: APuU4Z8plc32owX7hgNQYYZBO/btVQ0cf0m+qbVNkYwJvx2H5zc8EidG
	S1I40w1DTA5rFBsnGOXdt2f/Zx2s8BEHmZnIcPkYdbM1MKwxgu9qG8VpqK7/0Igu+PYXiJVLnup
	4fUjCZDX/E+FEX8BTlAGDaY9dpj1nvJyS8fc/
X-Gm-Gg: AYBFou0+DCwQFaQHiF6wo7ykNlZQEAMbLQbxzViJF/9ARQmvQ8mvcMsveykwhaDNSVF
	iC8JN3Z0If7jSlv2SmBgaKaXUwOAYq2kinDAUfrT37wHOgzh+wu1GF2Djje8oKgwJ6EFpkYkEUq
	ZKMGSil7VfgzjE18kdV7aG5NsY7byErqkkvulK0vY78tnnSvsrdm4XkDba2KbzZ2PnrnPmL9Zjv
	ijZJh85FHkqAchC8pmy89DlfPGhN38gRLgVGMNmuJC3xJ6H78lUgnkpFvGQCGARjeAKFAccrqNR
	SsQHMDsay+A4w97BHbFpgxYi1deMvp9n5Q7hk5aPnzHbZX951JvDWqrj8Yzu1rWqLvq/7BglZ7q
	qs3D6qPnFHZaZ7KIQaqoOei7d0DT0I8Cd5Rq8bJYAT50XBqnlPZUjfa4fLFRf78cWTg==
X-Received: by 2002:a05:6820:f015:b0:71a:df0d:ea24 with SMTP id
 006d021491bc7-71b394f3a89mr374897eaf.51.1795112161301; Thu, 19 Nov 2026
 10:16:01 -0800 (PST)
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Brian Martin <brayniac@gmail.com>
Date: Thu, 19 Nov 2026 10:15:49 -0800
X-Gm-Features: AclHuK-euaaotGlQEH8vV28xE7RGAxWu5oR3nT7glC9NbGwMmMFkOeQ9tv8N-rM
Message-ID: <CAC+fX10wVVSqGnfCg+aazorsCxB34sUDV-XJiBPd6R3Kuqc-7Q@mail.gmail.com>
Subject: io_uring/net: SEND_ZC from a registered huge-page buffer overcharges sk_wmem_queued
To: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000b526e00660a51eaa"

--000000000000b526e00660a51eaa
Content-Type: text/plain; charset="UTF-8"

Hi Jens, Pavel,

A zero-copy send from a registered buffer backed by huge pages is charged
to the socket's send buffer for every page between the start of the
bvec and the start of the data. In the test below, sending the last
page-aligned 4 KiB of a registered 2 MiB folio increased sk_wmem_queued
by 2 MiB. The same send from the same address without a registered
buffer increased it by 4 KiB.

Cause, as I read it: io_sg_from_iter() charges each frag

truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);

and v comes from mp_bvec_iter_bvec(), whose bv_offset is relative to the
first page of the bvec. Registration coalesces a buffer inside one huge
folio into one multi-page bvec since 6.3:

  57bebf807e2a ("io_uring/rsrc: optimise registered huge pages")

and, since 6.12, an eligible buffer of several huge folios into one bvec
per folio:

  a8edbb424b13 ("io_uring/rsrc: enable multi-hugepage buffer coalescing")

so bv_offset can be up to the folio size minus one byte. The iovec path,
zerocopy_fill_skb_from_iter(), charges PAGE_ALIGN(copied + start) with
start the offset within the first page.

Reproducer
----------

zc_charge.c (attached, about 250 lines, needs liburing) registers two
buffers over a 4 MiB region: buf 0 is the first 2 MiB, buf 1 all 4 MiB.
For each offset it opens a loopback TCP connection whose receiver does
not read, queues 192 KiB with send() so later data stays queued, issues
one 4096-byte SEND_ZC, and reads SK_MEMINFO_WMEM_QUEUED before and after.
"fixed" uses the registered buffer, "plain" is SEND_ZC from the same
address without one. It checks with SIOCOUTQNSD that the 4096 bytes are still
unsent when it samples the counter. An ACK of earlier data in that
interval would lower the measured charge, not raise it. (The attachments
have a .txt suffix so they show as text in archives.)

  gcc -O2 -Wall -o zc_charge zc_charge.c -luring
  echo 8 > /proc/sys/vm/nr_hugepages
  ./zc_charge hugetlb      # or thp, or small (MADV_NOHUGEPAGE)

On 7.4.0-rc2, hugetlb (thp gives the same numbers). offset is relative
to the start of the registered buffer; fixed and plain are the increase
in sk_wmem_queued, in bytes:

  buf  offset    fixed    plain
  0    0          4096     4096
  0    4096       8192     4096
  0    65536     69632     4096
  0    1048576 1052672     4096
  0    2089060 2097152     8192   (crosses a page boundary)
  0    2093056 2097152     4096
  1    2093056 2097152     4096
  1    2097152    4096     4096   (start of the second folio)
  1    3145728 1052672     4096
  1    4190208 2097152     4096

These are the deltas the program printed. On every row the unsent byte
count rose by 4096 in both sends. With 4 KiB pages ("small") fixed equals
plain on every row. In a separate check on 7.4.0-rc2 and 6.12.116, an
ordinary send() of 4096 bytes on the same kind of connection also added
4096, as did a fixed send at offset 0; a fixed send at 1 MiB added
1052672.

zc_truesize.bt (attached; tested with bpftrace 0.23, needs BTF) traces
__zerocopy_sg_from_iter(), which adds each zero-copy fill's truesize to
sk_wmem_queued. For each call it prints the bytes added, the truesize
charged, and what PAGE_ALIGN(len + offset_in_page) gives for the new
frags. Run alongside zc_charge on 7.4.0-rc2 and 6.12.116, its "charged"
matched zc_charge's fixed and plain columns on every row, and only fills
through io_sg_from_iter differed from the iovec rule. Two lines from it:

  fill                    bytes  charged  iovec-rule
  io_sg_from_iter          4096  1052672        4096   (buf 0, 1 MiB)
  io_sg_from_iter_iovec    4096     4096        4096   (same address)

  bpftrace zc_truesize.bt zc_charge    # then run zc_charge

Kernels
-------

Same program, kernels tested:

  6.1.0-53 (Debian)              no overcharge
  6.6.13, 6.11.10 (Debian bpo),
  6.8.0-142 (Ubuntu)             overcharge on buf 0 only (one folio)
  6.12.116, 6.18.15, 7.1.13,
  7.2.12 (Debian), 7.3.4,
  7.4.0-rc2 (kernel.org)         overcharge on buf 0 and buf 1

which matches the two commits above.

Effect on throughput
--------------------

The overcharge fills sk_sndbuf with far less data in flight than the
charge says, so the sender stalls on -EAGAIN. Setup: one TCP connection
over a 10 Gbit/s i40e link (KVM guests with the NIC passed through), and
one sender thread with one send in flight at a time. Sends use
MSG_DONTWAIT, so a full socket completes with -EAGAIN or a short count;
the sender then waits for POLLOUT and resubmits the rest. SO_SNDBUF is
not set (autotuned from tcp_wmem). Each send takes the next 16, 64 or
256 KiB of a 64 MiB registered region, in order, wrapping at the end, so
sends step through each 2 MiB folio from start to end. 10 second windows,
range over four windows per configuration, interleaved. Kernel:
io_uring-7.4 (0659e44ce739) with the charge selectable at run time by a
module parameter I added for the test.

  send size  current  page-offset  4K pages,  SENDMSG_ZC
             charge   charge       current    (iovec)
  16 KiB     1.86-1.89  9.41-9.42  9.41-9.42  9.22-9.41
  64 KiB     3.90-3.98  9.41-9.42  9.37-9.42  9.41-9.42
  256 KiB    6.88-7.44  9.41-9.42  9.41-9.42  9.40-9.42

(Gbit/s; all fixed-buffer columns are THP-backed except "4K pages".)
At 16 KiB the current charge gave 53,000-58,000 -EAGAIN send completions
per window; the page-offset charge gave 1-6.

The "page-offset charge" column is

truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));

with the frag descriptor still given the full bv_offset. With it,
zc_charge reports fixed equal to plain on every row, including 8192 for
a send that crosses a page boundary. Charging v.bv_len alone also
removes the stall but charges a page-crossing 4 KiB send 4096 where the
iovec path charges 8192, so it charges less than the iovec path does.

I'm sending this as a report rather than a patch; happy to test anything
you'd like checked.

I used an AI assistant (Claude) to find the cause, write the reproducer,
run the measurements and draft this email; I've checked the analysis and
the numbers.

Thanks,
Brian Martin

---

The change measured above, against io_uring-7.4 (0659e44ce739). The same
diff is attached as io_sg_from_iter-truesize.diff, in case my mail client
converts the tabs below.

--- a/io_uring/net.c
+++ b/io_uring/net.c
@@ -1501,7 +1501,7 @@ static int io_sg_from_iter(struct sk_buff *skb,
  struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);

  copied += v.bv_len;
- truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
+ truesize += PAGE_ALIGN(v.bv_len + offset_in_page(v.bv_offset));
  __skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
    v.bv_offset, v.bv_len);
  bvec_iter_advance_single(from->bvec, &bi, v.bv_len);

--000000000000b526e00660a51eaa
Content-Type: text/plain; charset="US-ASCII"; name="zc_charge.c.txt"
Content-Disposition: attachment; filename="zc_charge.c.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mwnv8b4f1>
X-Attachment-Id: f_mwnv8b4f1

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAovKgogKiB6Y19jaGFyZ2U6IG1lYXN1cmUg
aG93IG11Y2ggb2YgYSBUQ1Agc29ja2V0J3Mgc2VuZCBidWZmZXIgb25lIGlvX3VyaW5nCiAqIHpl
cm8tY29weSBzZW5kIGlzIGNoYXJnZWQsIGZvciBTRU5EX1pDIGZyb20gYSByZWdpc3RlcmVkIChm
aXhlZCkgYnVmZmVyIGFuZAogKiBmb3IgU0VORF9aQyBmcm9tIHRoZSBzYW1lIGFkZHJlc3Mgd2l0
aG91dCBvbmUuCiAqCiAqIEVhY2ggbWVhc3VyZW1lbnQgb3BlbnMgYSBmcmVzaCBsb29wYmFjayBj
b25uZWN0aW9uIHdob3NlIHJlY2VpdmVyIG5ldmVyCiAqIHJlYWRzIGFuZCBoYXMgYSA2NCBLaUIg
cmVjZWl2ZSBidWZmZXIsIGFuZCBxdWV1ZXMgMTkyIEtpQiB3aXRoIGEgcGxhaW4KICogc2VuZCgp
IGZpcnN0LCBzbyB0aGUgemVyby1jb3B5IHNlbmQgdGhhdCBmb2xsb3dzIHN0YXlzIGluIHRoZSB3
cml0ZSBxdWV1ZS4KICogVGhlIHJlY2VpdmUgYnVmZmVyIG11c3Qgbm90IGJlIHRpbnk6IFRDUCBz
aXplcyBza2JzIHRvIGhhbGYgdGhlIHBlZXIncwogKiBsYXJnZXN0IHdpbmRvdywgYW5kIGEgdGlu
eSB3aW5kb3cgc3BsaXRzIG9uZSA0IEtpQiBzZW5kIGludG8gbWFueSBza2JzLgogKiBUaGUgY2hh
cmdlIGlzIHRoZSBjaGFuZ2UgaW4gU0tfTUVNSU5GT19XTUVNX1FVRVVFRCAoU09fTUVNSU5GTykg
YWNyb3NzIHRoZQogKiBzZW5kLCBhbmQgImV4Y2VzcyIgaXMgZml4ZWQgbWludXMgcGxhaW4uCiAq
CiAqIFR3byBidWZmZXJzIGFyZSByZWdpc3RlcmVkIG92ZXIgb25lIDQgTWlCIHJlZ2lvbjogYnVm
IDAgaXMgdGhlIGZpcnN0IDIgTWlCCiAqIChvbmUgaHVnZSBmb2xpbyB3aGVuIHRoZSByZWdpb24g
aXMgb24gaHVnZSBwYWdlcyksIGJ1ZiAxIGlzIGFsbCA0IE1pQiAodHdvCiAqIGZvbGlvcykuCiAq
CiAqIFVzYWdlOiB6Y19jaGFyZ2UgaHVnZXRsYnx0aHB8c21hbGwKICogICAgICAgIGh1Z2V0bGIg
bmVlZHMgdm0ubnJfaHVnZXBhZ2VzID49IDIuIFJlZ2lzdGVyaW5nIHRoZSBidWZmZXJzIG5lZWRz
CiAqICAgICAgICByb290IG9yIGFuIFJMSU1JVF9NRU1MT0NLIGxhcmdlIGVub3VnaCBmb3IgdGhl
bS4KICogQnVpbGQ6IGdjYyAtTzIgLVdhbGwgLW8gemNfY2hhcmdlIHpjX2NoYXJnZS5jIC1sdXJp
bmcKICovCiNkZWZpbmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPGVycm5vLmg+CiNpbmNsdWRlIDxs
aWJ1cmluZy5oPgojaW5jbHVkZSA8bGludXgvc29ja2lvcy5oPgojaW5jbHVkZSA8bmV0aW5ldC9p
bi5oPgojaW5jbHVkZSA8bmV0aW5ldC90Y3AuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVk
ZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNs
dWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHN5cy9tbWFuLmg+CiNpbmNsdWRlIDxzeXMvc29j
a2V0Lmg+CiNpbmNsdWRlIDxzeXMvdXRzbmFtZS5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojaWZu
ZGVmIFNPX01FTUlORk8KI2RlZmluZSBTT19NRU1JTkZPIDU1CiNlbmRpZgojZGVmaW5lIE1FTUlO
Rk9fVkFSUyA5CiNkZWZpbmUgTUVNSU5GT19XTUVNX1FVRVVFRCA1CgojZGVmaW5lIEhQQUdFICgy
VUwgPDwgMjApCiNkZWZpbmUgUEcgNDA5NlVMCiNkZWZpbmUgUkVHSU9OICgyICogSFBBR0UpCgpz
dGF0aWMgdm9pZCBkaWUoY29uc3QgY2hhciAqd2hhdCwgaW50IGVycikKewoJZnByaW50ZihzdGRl
cnIsICJ6Y19jaGFyZ2U6ICVzOiAlc1xuIiwgd2hhdCwgc3RyZXJyb3IoZXJyKSk7CglleGl0KDEp
Owp9CgpzdGF0aWMgbG9uZyB3bWVtX3F1ZXVlZChpbnQgZmQpCnsKCXVpbnQzMl90IG1pW01FTUlO
Rk9fVkFSU107Cglzb2NrbGVuX3QgbCA9IHNpemVvZihtaSk7CgoJaWYgKGdldHNvY2tvcHQoZmQs
IFNPTF9TT0NLRVQsIFNPX01FTUlORk8sIG1pLCAmbCkpCgkJZGllKCJnZXRzb2Nrb3B0KFNPX01F
TUlORk8pIiwgZXJybm8pOwoJcmV0dXJuIG1pW01FTUlORk9fV01FTV9RVUVVRURdOwp9CgpzdGF0
aWMgaW50IHVuc2VudChpbnQgZmQpCnsKCWludCBuOwoKCWlmIChpb2N0bChmZCwgU0lPQ09VVFFO
U0QsICZuKSkKCQlkaWUoImlvY3RsKFNJT0NPVVRRTlNEKSIsIGVycm5vKTsKCXJldHVybiBuOwp9
CgovKiBBIGxvb3BiYWNrIGNvbm5lY3Rpb24gd2l0aCBkYXRhIHF1ZXVlZCB0aGF0IHRoZSByZWNl
aXZlciB3aWxsIG5vdCB0YWtlLiAqLwpzdGF0aWMgaW50IHN0dWNrX2Nvbm4oaW50ICpwZWVyKQp7
CglzdGF0aWMgY2hhciBmaWxsWzE5MiA8PCAxMF07CglzdHJ1Y3Qgc29ja2FkZHJfaW4gYTsKCXNv
Y2tsZW5fdCBhbCA9IHNpemVvZihhKTsKCS8qIFNPX1NOREJVRiBpcyBjYXBwZWQgYXQgbmV0LmNv
cmUud21lbV9tYXg7IHRoZSB0ZXN0IGRvZXMgbm90IG5lZWQKCSAqIHRoZSBmdWxsIDEgTWlCLCBv
bmx5IHJvb20gZm9yIHRoZSBwcmVmaWxsIGFuZCBvbmUgc2VuZC4gKi8KCWludCBvbmUgPSAxLCBy
Y3YgPSA2NCA8PCAxMCwgYmlnID0gMSA8PCAyMDsKCWludCBsLCBjOwoKCW1lbXNldCgmYSwgMCwg
c2l6ZW9mKGEpKTsKCWEuc2luX2ZhbWlseSA9IEFGX0lORVQ7CglhLnNpbl9hZGRyLnNfYWRkciA9
IGh0b25sKElOQUREUl9MT09QQkFDSyk7CglsID0gc29ja2V0KEFGX0lORVQsIFNPQ0tfU1RSRUFN
LCAwKTsKCWlmIChsIDwgMCkKCQlkaWUoInNvY2tldCIsIGVycm5vKTsKCWlmIChzZXRzb2Nrb3B0
KGwsIFNPTF9TT0NLRVQsIFNPX1JDVkJVRiwgJnJjdiwgc2l6ZW9mKHJjdikpKQoJCWRpZSgiU09f
UkNWQlVGIiwgZXJybm8pOwoJaWYgKGJpbmQobCwgKHN0cnVjdCBzb2NrYWRkciAqKSZhLCBzaXpl
b2YoYSkpIHx8IGxpc3RlbihsLCAxKSB8fAoJICAgIGdldHNvY2tuYW1lKGwsIChzdHJ1Y3Qgc29j
a2FkZHIgKikmYSwgJmFsKSkKCQlkaWUoImxpc3RlbiIsIGVycm5vKTsKCWMgPSBzb2NrZXQoQUZf
SU5FVCwgU09DS19TVFJFQU0sIDApOwoJaWYgKGMgPCAwKQoJCWRpZSgic29ja2V0IiwgZXJybm8p
OwoJaWYgKHNldHNvY2tvcHQoYywgU09MX1NPQ0tFVCwgU09fU05EQlVGLCAmYmlnLCBzaXplb2Yo
YmlnKSkgfHwKCSAgICBzZXRzb2Nrb3B0KGMsIElQUFJPVE9fVENQLCBUQ1BfTk9ERUxBWSwgJm9u
ZSwgc2l6ZW9mKG9uZSkpKQoJCWRpZSgic2V0c29ja29wdCIsIGVycm5vKTsKCWlmIChjb25uZWN0
KGMsIChzdHJ1Y3Qgc29ja2FkZHIgKikmYSwgc2l6ZW9mKGEpKSkKCQlkaWUoImNvbm5lY3QiLCBl
cnJubyk7CgkqcGVlciA9IGFjY2VwdChsLCBOVUxMLCBOVUxMKTsKCWlmICgqcGVlciA8IDApCgkJ
ZGllKCJhY2NlcHQiLCBlcnJubyk7CgljbG9zZShsKTsKCS8qIE1TR19FT1Iga2VlcHMgdGhlIHpl
cm8tY29weSBzZW5kIG91dCBvZiB0aGlzIHNrYi4gKi8KCWlmIChzZW5kKGMsIGZpbGwsIHNpemVv
ZihmaWxsKSwgTVNHX0RPTlRXQUlUIHwgTVNHX0VPUikgIT0gc2l6ZW9mKGZpbGwpKQoJCWRpZSgi
cHJlZmlsbCBzZW5kIiwgZXJybm8pOwoJdXNsZWVwKDEwMDAwMCk7CglpZiAodW5zZW50KGMpIDwg
KDMyIDw8IDEwKSkgewoJCWZwcmludGYoc3RkZXJyLCAiemNfY2hhcmdlOiBsZXNzIHRoYW4gMzIg
S2lCIG9mIHRoZSBwcmVmaWxsIGlzIHVuc2VudFxuIik7CgkJZXhpdCgxKTsKCX0KCXJldHVybiBj
Owp9CgovKiBDaGFyZ2Ugb2Ygb25lIFNFTkRfWkMgb2YgbGVuIGJ5dGVzIGF0IHA7IGJ1Zl9pbmRl
eCA8IDAgc2VuZHMgd2l0aG91dCBhCiAqIHJlZ2lzdGVyZWQgYnVmZmVyLiAqLwpzdGF0aWMgbG9u
ZyBjaGFyZ2Uoc3RydWN0IGlvX3VyaW5nICpyaW5nLCBjaGFyICpwLCB1bnNpZ25lZCBsZW4sIGlu
dCBidWZfaW5kZXgsCgkJICAgaW50ICpoZWxkKQp7CglzdHJ1Y3QgaW9fdXJpbmdfc3FlICpzcWU7
CglzdHJ1Y3QgaW9fdXJpbmdfY3FlICpjcWU7CglzdHJ1Y3QgX19rZXJuZWxfdGltZXNwZWMgdHMg
PSB7IC50dl9zZWMgPSA1IH07CglzdHJ1Y3QgbGluZ2VyIGxnID0geyAubF9vbm9mZiA9IDEsIC5s
X2xpbmdlciA9IDAgfTsKCWludCBwZWVyLCBjLCByZXMsIHJldCwgdTA7Cgl1bnNpZ25lZCBmbGFn
czsKCWxvbmcgdzAsIGQ7CgoJYyA9IHN0dWNrX2Nvbm4oJnBlZXIpOwoJdzAgPSB3bWVtX3F1ZXVl
ZChjKTsKCXUwID0gdW5zZW50KGMpOwoJc3FlID0gaW9fdXJpbmdfZ2V0X3NxZShyaW5nKTsKCWlm
IChidWZfaW5kZXggPj0gMCkKCQlpb191cmluZ19wcmVwX3NlbmRfemNfZml4ZWQoc3FlLCBjLCBw
LCBsZW4sIDAsIDAsIGJ1Zl9pbmRleCk7CgllbHNlCgkJaW9fdXJpbmdfcHJlcF9zZW5kX3pjKHNx
ZSwgYywgcCwgbGVuLCAwLCAwKTsKCWlvX3VyaW5nX3N1Ym1pdChyaW5nKTsKCXJldCA9IGlvX3Vy
aW5nX3dhaXRfY3FlX3RpbWVvdXQocmluZywgJmNxZSwgJnRzKTsKCWlmIChyZXQpCgkJZGllKCJ3
YWl0aW5nIGZvciB0aGUgc2VuZCIsIC1yZXQpOwoJcmVzID0gY3FlLT5yZXM7CglmbGFncyA9IGNx
ZS0+ZmxhZ3M7Cglpb191cmluZ19jcWVfc2VlbihyaW5nLCBjcWUpOwoJaWYgKHJlcyAhPSAoaW50
KWxlbikgewoJCWZwcmludGYoc3RkZXJyLCAiemNfY2hhcmdlOiBzZW5kIHJldHVybmVkICVkLCB3
YW50ZWQgJXVcbiIsIHJlcywgbGVuKTsKCQlleGl0KDEpOwoJfQoJZCA9IHdtZW1fcXVldWVkKGMp
IC0gdzA7CgkvKiAxIGlmIHRoZSBzZW50IGJ5dGVzIGFyZSBzdGlsbCB1bnNlbnQsIHNvIG5vIEFD
SyBjb3ZlcmVkIHRoZW0uIEFuCgkgKiBBQ0sgb2YgZWFybGllciBwcmVmaWxsIGRhdGEgd291bGQg
bG93ZXIgZCwgbm90IHJhaXNlIGl0LiAqLwoJKmhlbGQgPSB1bnNlbnQoYykgLSB1MCA9PSAoaW50
KWxlbjsKCgkvKiBEaXNjYXJkIHRoZSBxdWV1ZWQgZGF0YSBzbyB0aGUgbm90aWZpY2F0aW9uIGFy
cml2ZXMuICovCglzZXRzb2Nrb3B0KGMsIFNPTF9TT0NLRVQsIFNPX0xJTkdFUiwgJmxnLCBzaXpl
b2YobGcpKTsKCWNsb3NlKGMpOwoJY2xvc2UocGVlcik7CglpZiAoZmxhZ3MgJiBJT1JJTkdfQ1FF
X0ZfTU9SRSkgewoJCXJldCA9IGlvX3VyaW5nX3dhaXRfY3FlX3RpbWVvdXQocmluZywgJmNxZSwg
JnRzKTsKCQlpZiAocmV0KQoJCQlkaWUoIndhaXRpbmcgZm9yIHRoZSBub3RpZmljYXRpb24iLCAt
cmV0KTsKCQlpb191cmluZ19jcWVfc2VlbihyaW5nLCBjcWUpOwoJfQoJcmV0dXJuIGQ7Cn0KCnN0
YXRpYyB2b2lkIGFub25faHVnZShjb25zdCBjaGFyICpsYWJlbCkKewoJY2hhciBsaW5lWzI1Nl07
CglGSUxFICpmID0gZm9wZW4oIi9wcm9jL3NlbGYvc21hcHNfcm9sbHVwIiwgInIiKTsKCgl3aGls
ZSAoZiAmJiBmZ2V0cyhsaW5lLCBzaXplb2YobGluZSksIGYpKQoJCWlmICghc3RybmNtcChsaW5l
LCAiQW5vbkh1Z2VQYWdlczoiLCAxNCkgfHwKCQkgICAgIXN0cm5jbXAobGluZSwgIlByaXZhdGVf
SHVnZXRsYjoiLCAxNikpCgkJCXByaW50ZigiIyAlcyAlcyIsIGxhYmVsLCBsaW5lKTsKCWlmIChm
KQoJCWZjbG9zZShmKTsKfQoKaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQp7Cgljb25z
dCBjaGFyICptb2RlID0gYXJnYyA+IDEgPyBhcmd2WzFdIDogImh1Z2V0bGIiOwoJc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGxvbmcgb2ZmMFtdID0gewoJCTAsIFBHLCA2NCA8PCAxMCwgMSA8PCAyMCwg
SFBBR0UgLSAyICogUEcgKyAxMDAsIEhQQUdFIC0gUEcsCgl9OwoJc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGxvbmcgb2ZmMVtdID0gewoJCUhQQUdFIC0gUEcsIEhQQUdFLCBIUEFHRSArICgxIDw8IDIw
KSwgMiAqIEhQQUdFIC0gUEcsCgl9OwoJY29uc3QgdW5zaWduZWQgbGVuID0gNDA5NjsKCXN0cnVj
dCBpb191cmluZyByaW5nOwoJc3RydWN0IGlvdmVjIGlvdlsyXTsKCXN0cnVjdCB1dHNuYW1lIHU7
CgljaGFyICptOwoJaW50IHJldCwgYjsKCXNpemVfdCBpOwoKCWlmICghc3RyY21wKG1vZGUsICJo
dWdldGxiIikpIHsKCQltID0gbW1hcChOVUxMLCBSRUdJT04sIFBST1RfUkVBRCB8IFBST1RfV1JJ
VEUsCgkJCSBNQVBfUFJJVkFURSB8IE1BUF9BTk9OWU1PVVMgfCBNQVBfSFVHRVRMQiwgLTEsIDAp
OwoJCWlmIChtID09IE1BUF9GQUlMRUQpCgkJCWRpZSgibW1hcChNQVBfSFVHRVRMQik7IHNldCB2
bS5ucl9odWdlcGFnZXMgPj0gMiIsIGVycm5vKTsKCX0gZWxzZSBpZiAoIXN0cmNtcChtb2RlLCAi
dGhwIikgfHwgIXN0cmNtcChtb2RlLCAic21hbGwiKSkgewoJCWNoYXIgKnJhdyA9IG1tYXAoTlVM
TCwgUkVHSU9OICsgSFBBR0UsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCgkJCQkgTUFQX1BSSVZB
VEUgfCBNQVBfQU5PTllNT1VTLCAtMSwgMCk7CgoJCWlmIChyYXcgPT0gTUFQX0ZBSUxFRCkKCQkJ
ZGllKCJtbWFwIiwgZXJybm8pOwoJCW0gPSAoY2hhciAqKSgoKHVpbnRwdHJfdClyYXcgKyBIUEFH
RSAtIDEpICYgfihIUEFHRSAtIDEpKTsKCQlpZiAobWFkdmlzZShtLCBSRUdJT04sIHN0cmNtcCht
b2RlLCAidGhwIikgPyBNQURWX05PSFVHRVBBR0UgOgoJCQkJCQkJICAgICBNQURWX0hVR0VQQUdF
KSkKCQkJZGllKCJtYWR2aXNlIiwgZXJybm8pOwoJfSBlbHNlIHsKCQlmcHJpbnRmKHN0ZGVyciwg
InVzYWdlOiB6Y19jaGFyZ2UgaHVnZXRsYnx0aHB8c21hbGxcbiIpOwoJCXJldHVybiAyOwoJfQoJ
bWVtc2V0KG0sIDEsIFJFR0lPTik7Cgl1bmFtZSgmdSk7CglwcmludGYoIiMga2VybmVsICVzLCBt
b2RlICVzLCBzZW5kICV1IGJ5dGVzXG4iLCB1LnJlbGVhc2UsIG1vZGUsIGxlbik7Cglhbm9uX2h1
Z2UobW9kZSk7CgoJcmV0ID0gaW9fdXJpbmdfcXVldWVfaW5pdCg4LCAmcmluZywgMCk7CglpZiAo
cmV0KQoJCWRpZSgiaW9fdXJpbmdfcXVldWVfaW5pdCIsIC1yZXQpOwoJaW92WzBdLmlvdl9iYXNl
ID0gbTsKCWlvdlswXS5pb3ZfbGVuID0gSFBBR0U7Cglpb3ZbMV0uaW92X2Jhc2UgPSBtOwoJaW92
WzFdLmlvdl9sZW4gPSBSRUdJT047CglyZXQgPSBpb191cmluZ19yZWdpc3Rlcl9idWZmZXJzKCZy
aW5nLCBpb3YsIDIpOwoJaWYgKHJldCkKCQlkaWUoImlvX3VyaW5nX3JlZ2lzdGVyX2J1ZmZlcnMi
LCAtcmV0KTsKCglwcmludGYoIiUtOHMgJS00cyAlOHMgJTZzICU4cyAlOHMgJThzICU0c1xuIiwg
Im1vZGUiLCAiYnVmIiwgIm9mZnNldCIsCgkgICAgICAgImxlbiIsICJmaXhlZCIsICJwbGFpbiIs
ICJleGNlc3MiLCAiaGVsZCIpOwoJZm9yIChiID0gMDsgYiA8IDI7IGIrKykgewoJCWNvbnN0IHVu
c2lnbmVkIGxvbmcgKm9mZnMgPSBiID8gb2ZmMSA6IG9mZjA7CgkJc2l6ZV90IG4gPSBiID8gc2l6
ZW9mKG9mZjEpIC8gc2l6ZW9mKG9mZjFbMF0pIDoKCQkJICAgICAgIHNpemVvZihvZmYwKSAvIHNp
emVvZihvZmYwWzBdKTsKCgkJZm9yIChpID0gMDsgaSA8IG47IGkrKykgewoJCQlpbnQgaGYsIGhw
OwoJCQlsb25nIGYgPSBjaGFyZ2UoJnJpbmcsIG0gKyBvZmZzW2ldLCBsZW4sIGIsICZoZik7CgkJ
CWxvbmcgcCA9IGNoYXJnZSgmcmluZywgbSArIG9mZnNbaV0sIGxlbiwgLTEsICZocCk7CgoJCQlw
cmludGYoIiUtOHMgJS00ZCAlOGx1ICU2dSAlOGxkICU4bGQgJThsZCAlZC8lZFxuIiwKCQkJICAg
ICAgIG1vZGUsIGIsIG9mZnNbaV0sIGxlbiwgZiwgcCwgZiAtIHAsIGhmLCBocCk7CgkJfQoJfQoJ
aW9fdXJpbmdfcXVldWVfZXhpdCgmcmluZyk7CglyZXR1cm4gMDsKfQo=
--000000000000b526e00660a51eaa
Content-Type: text/plain; charset="US-ASCII"; name="zc_truesize.bt.txt"
Content-Disposition: attachment; filename="zc_truesize.bt.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mwnv8b4j2>
X-Attachment-Id: f_mwnv8b4j2

IyEvdXNyL2Jpbi9lbnYgYnBmdHJhY2UKLyoKICogemNfdHJ1ZXNpemUuYnQ6IGZvciBlYWNoIHpl
cm8tY29weSBmaWxsIG9mIGEgVENQIHNrYiwgcHJpbnQgdGhlIGJ5dGVzCiAqIGFkZGVkIGFuZCB0
aGUgdHJ1ZXNpemUgY2hhcmdlZCB0byBza193bWVtX3F1ZXVlZCwgbmV4dCB0byB0aGUgY2hhcmdl
IHRoZQogKiBpb3ZlYyBwYXRoIHdvdWxkIG1ha2UgZm9yIHRoZSBzYW1lIGZyYWdzIChQQUdFX0FM
SUdOKGxlbiArIG9mZnNldCB3aXRoaW4KICogdGhlIGZpcnN0IHBhZ2UpLCBzdW1tZWQgb3ZlciB0
aGUgbmV3IGZyYWdzKS4KICoKICogX196ZXJvY29weV9zZ19mcm9tX2l0ZXIoKSBpcyB0aGUgb25l
IHBsYWNlIHRoYXQgYWRkcyBhIHplcm8tY29weSBmaWxsJ3MKICogdHJ1ZXNpemUgdG8gc2tfd21l
bV9xdWV1ZWQsIGZvciBNU0dfWkVST0NPUFkgYW5kIGZvciBib3RoIGlvX3VyaW5nCiAqIFNFTkRf
WkMgZmlsbCBjYWxsYmFja3MgKG1zZy0+c2dfZnJvbV9pdGVyKS4gImZpbGwiIG5hbWVzIHRoZSBj
YWxsYmFjazoKICogaW9fc2dfZnJvbV9pdGVyIGZvciBhIHJlZ2lzdGVyZWQgYnVmZmVyLCBpb19z
Z19mcm9tX2l0ZXJfaW92ZWMgd2l0aG91dAogKiBvbmUsIG9yICItIiBmb3IgTVNHX1pFUk9DT1BZ
LgogKgogKiBOZWVkcyBrZXJuZWwgQlRGOyB0ZXN0ZWQgd2l0aCBicGZ0cmFjZSAwLjIzLjIuIFdy
aXR0ZW4gYWdhaW5zdCB0aGUKICogc3RydWN0IHNrYl9mcmFnIGxheW91dCAobmV0bWVtL2xlbi9v
ZmZzZXQpIG9mIDYuMTIgYW5kIGxhdGVyLgogKiBpb3ZlYy1ydWxlIGNvdW50cyBvbmx5IGZyYWdz
IHRoZSBjYWxsIGFkZGVkLiBBIGZpbGwgdGhhdCBleHRlbmRzIHRoZQogKiBwcmV2aW91cyBmcmFn
IGluc3RlYWQgYWRkcyBub25lLCBhbmQgc2hvd3MgaW92ZWMtcnVsZSAwLgogKgogKiBVc2FnZTog
YnBmdHJhY2UgemNfdHJ1ZXNpemUuYnQgW2NvbW1dICAgKGRlZmF1bHQ6IGFsbCBwcm9jZXNzZXMp
CiAqLwoKZmVudHJ5Ol9femVyb2NvcHlfc2dfZnJvbV9pdGVyCi8gJCMgPT0gMCB8fCBjb21tID09
IHN0cigkMSkgLwp7Cgkkc2tiID0gYXJncy5za2I7Cgkkc2ggPSAoc3RydWN0IHNrYl9zaGFyZWRf
aW5mbyAqKSgkc2tiLT5oZWFkICsgJHNrYi0+ZW5kKTsKCglAbGVuW3RpZF0gPSAkc2tiLT5sZW47
CglAdHNbdGlkXSA9ICRza2ItPnRydWVzaXplOwoJQG5mW3RpZF0gPSAkc2gtPm5yX2ZyYWdzOwoJ
QG9uW3RpZF0gPSAxOwp9CgpmZXhpdDpfX3plcm9jb3B5X3NnX2Zyb21faXRlcgovIEBvblt0aWRd
IC8KewoJJHNrYiA9IGFyZ3Muc2tiOwoJJHNoID0gKHN0cnVjdCBza2Jfc2hhcmVkX2luZm8gKiko
JHNrYi0+aGVhZCArICRza2ItPmVuZCk7CgkkZmlsbCA9IChhcmdzLm1zZyAhPSAwICYmIGFyZ3Mu
bXNnLT5tc2dfdWJ1ZiAhPSAwKSA/CgkJKHVpbnQ2NClhcmdzLm1zZy0+c2dfZnJvbV9pdGVyIDog
KHVpbnQ2NCkwOwoKCS8qIGlvdmVjLXBhdGggY2hhcmdlIGZvciB0aGUgZnJhZ3MgdGhpcyBjYWxs
IGFkZGVkIChhdCBtb3N0IDQpLiAqLwoJJGV4cCA9ICh1aW50NjQpMDsKCSRpID0gQG5mW3RpZF07
CgkkbiA9ICRzaC0+bnJfZnJhZ3M7Cgl1bnJvbGwoNCkgewoJCWlmICgkaSA8ICRuKSB7CgkJCSRm
ID0gKHN0cnVjdCBza2JfZnJhZyAqKSgodWludDY0KSRzaCArCgkJCQlvZmZzZXRvZihzdHJ1Y3Qg
c2tiX3NoYXJlZF9pbmZvLCBmcmFncykgKwoJCQkJJGkgKiBzaXplb2Yoc3RydWN0IHNrYl9mcmFn
KSk7CgkJCSRleHAgKz0gKCh1aW50NjQpJGYtPmxlbiArICgkZi0+b2Zmc2V0ICYgNDA5NSkgKyA0
MDk1KSAmCgkJCQl+KHVpbnQ2NCk0MDk1OwoJCQkkaSsrOwoJCX0KCX0KCglpZiAoJGZpbGwgIT0g
MCkgewoJCXByaW50ZigiJS0xMnMgZmlsbCAlLTIycyBieXRlcyAlOHUgZnJhZ3MgJXUgY2hhcmdl
ZCAlOXUgaW92ZWMtcnVsZSAlOXUiLAoJCSAgICAgICBjb21tLCBrc3ltKCRmaWxsKSwgJHNrYi0+
bGVuIC0gQGxlblt0aWRdLAoJCSAgICAgICAkbiAtIEBuZlt0aWRdLCAkc2tiLT50cnVlc2l6ZSAt
IEB0c1t0aWRdLCAkZXhwKTsKCX0gZWxzZSB7CgkJcHJpbnRmKCIlLTEycyBmaWxsICUtMjJzIGJ5
dGVzICU4dSBmcmFncyAldSBjaGFyZ2VkICU5dSBpb3ZlYy1ydWxlICU5dSIsCgkJICAgICAgIGNv
bW0sICItIiwgJHNrYi0+bGVuIC0gQGxlblt0aWRdLAoJCSAgICAgICAkbiAtIEBuZlt0aWRdLCAk
c2tiLT50cnVlc2l6ZSAtIEB0c1t0aWRdLCAkZXhwKTsKCX0KCXByaW50ZigiJXNcbiIsICRuIC0g
QG5mW3RpZF0gPiA0ID8gIiAgKG1vcmUgdGhhbiA0IGZyYWdzOyBpb3ZlYy1ydWxlIGNvdmVycyB0
aGUgZmlyc3QgNCkiIDogIiIpOwoKCWRlbGV0ZShAbGVuW3RpZF0pOwoJZGVsZXRlKEB0c1t0aWRd
KTsKCWRlbGV0ZShAbmZbdGlkXSk7CglkZWxldGUoQG9uW3RpZF0pOwp9CgpFTkQKewoJY2xlYXIo
QGxlbik7CgljbGVhcihAdHMpOwoJY2xlYXIoQG5mKTsKCWNsZWFyKEBvbik7Cn0K
--000000000000b526e00660a51eaa
Content-Type: text/plain; charset="US-ASCII"; name="io_sg_from_iter-truesize.diff.txt"
Content-Disposition: attachment; 
	filename="io_sg_from_iter-truesize.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mwnv8b4a0>
X-Attachment-Id: f_mwnv8b4a0

LS0tIGEvaW9fdXJpbmcvbmV0LmMKKysrIGIvaW9fdXJpbmcvbmV0LmMKQEAgLTE1MDEsNyArMTUw
MSw3IEBAIHN0YXRpYyBpbnQgaW9fc2dfZnJvbV9pdGVyKHN0cnVjdCBza19idWZmICpza2IsCiAJ
CXN0cnVjdCBiaW9fdmVjIHYgPSBtcF9idmVjX2l0ZXJfYnZlYyhmcm9tLT5idmVjLCBiaSk7Cgog
CQljb3BpZWQgKz0gdi5idl9sZW47Ci0JCXRydWVzaXplICs9IFBBR0VfQUxJR04odi5idl9sZW4g
KyB2LmJ2X29mZnNldCk7CisJCXRydWVzaXplICs9IFBBR0VfQUxJR04odi5idl9sZW4gKyBvZmZz
ZXRfaW5fcGFnZSh2LmJ2X29mZnNldCkpOwogCQlfX3NrYl9maWxsX3BhZ2VfZGVzY19ub2FjYyhz
aGluZm8sIGZyYWcrKywgdi5idl9wYWdlLAogCQkJCQkgICB2LmJ2X29mZnNldCwgdi5idl9sZW4p
OwogCQlidmVjX2l0ZXJfYWR2YW5jZV9zaW5nbGUoZnJvbS0+YnZlYywgJmJpLCB2LmJ2X2xlbik7
Cg==
--000000000000b526e00660a51eaa--
