Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55A1441021
	for <io-uring@vger.kernel.org>; Wed, 16 Sep 2026 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789594554; cv=pass; b=NEHrPI7phVql6sqo1N9koIwUS+qw6K95NQYoSQ65E8LtAenEs05ZLQEqrbwVMg42mwqSCsgyfs2SoPG718BjBkSma8XLUj3Obq6TosHl+Sw+hCbi20akRjhJTFnXo12ljXxkBGqMaJ3DRysX4xY+qQhkDbBWwCECuHyntjE9Ln8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789594554; c=relaxed/simple;
	bh=bwl8usRmUpomwcgVrl6oYNC1te2knxChcs8q6xzLh8E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PO61NsR6uDW81oAdD/lxBsNheCOk5Do6DHNGjsv6vG2PwrFSaAhhBNhP/QTLL5e+8q7NxS82LFTyzPgu8Vp2ibOJFNB03r0AlB3WTklDfzmihdAhYLZ/SoIyALHpKmsdLyLdiZ4mHxEStZ4uM2GtlBI8LtFs989oYuDMapqGemc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMRYyldC; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMRYyldC"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so33017766b.0
        for <io-uring@vger.kernel.org>; Wed, 16 Sep 2026 14:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789594545; cv=none;
        d=google.com; s=arc-20260327;
        b=o4XODGK/8uDfwo1odlWeemjI93/0751rUd7/60mrI4fmfpgBmPA1c5Cez9hV6zuGT2
         3c6dV5BBMFyXl3argUCr4omQDl1a7IJmguhrE6HUkS/qGnyhoIRDW7T2hxctgl5FTnOV
         INu6C2Uesl7FpXS7gESsZzBAcpSHP03E8Wwf6x7HaesQDlEIFzueDvLTzvv1nMJrKnka
         gwm/YPDjm1EoU8B8x7hOcSZCA5gVabwV6snJtuOvZgAftVLu7zLinqxK6dluk9a7Qgvz
         Uc9Ya3BqZwPAoG/vluXQSFW0gf4MZtO0OWYiGMjZXK+re+0eZCmBwap6KK7uMzVXHHev
         YMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hEcZM7rIw3igFPaXi00RMjxL21RsgTNfv5HAEi/CvbM=;
        fh=/qkdBqluHHaMk65zXiWQKOEvJEXfpcBZTQlOjagMPc4=;
        b=gUTGg5Zbv2Lr5gc9LEOkMGtp4G0kt+H/yWS5ndEzQ4/DkAoCwZFKWAE3eqS2jNtd3T
         qQsZdf1pxgi5qBllwo/TiERJZSLZRuUMXvRtx1FUrt62zspa1hsr68XZ2kgfdZzJQO/q
         /0xhaNuMvisoqeEb4MeAOeQ5F4gSd3qwjHejFG+Y116OtGlTw2PipwNKLZjIz5clDTGU
         f1Dipby93EEiP7nDdZqu5+HFVHM3yatqEan12SNdvbgLUUKm5L2OCyUj4QzxHQxoIJ3V
         UMOmGHh7AiyvVjPYiL05lQFejWpsrUMEf71aFcFkOBcY2IyLJh4qS7uPr58ehcQJDoL1
         Mm5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789594545; x=1790199345; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hEcZM7rIw3igFPaXi00RMjxL21RsgTNfv5HAEi/CvbM=;
        b=tMRYyldCcbliFPC7rZ1CCT1kD20ND3GCoI8rh62TVKILhifMdO4sFEtnpgJWy/Vksv
         7ZgOrI1vUoRyNFD+lHCGos0HKkurJzxjiKZRaoifFJvyo3ZAh2J2/JNC5sGwsN+6lJXc
         YMj5qpjqQAEOvrwmWaNrlzj+wWKZOMaPxZG4kyTPkhcgVxUC+uOQ5oAkRS5jst/k+Rv/
         glBTV0XTvNzYu8rFwrzsgp7p0xina7fp4Ihg1HS69CD68UBn3xQfD84gn/tkMmAnXN0X
         Czgd2MwRiT6haS7ZIw5PSh7zU0wIKVgHWTyZFG7pdjjWbVv7lyjjGmkk420yZIlI3Ww2
         jc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789594545; x=1790199345;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hEcZM7rIw3igFPaXi00RMjxL21RsgTNfv5HAEi/CvbM=;
        b=iJWJhneCbOt9ivR+JAENYAnBc5JWva7BqAo1hXxNOr3sACL8AKjnfu/lfsvN1SolBz
         r6yBASQYJXiUv4L3ExeehogrzdQQWKajmDJLi4Z1YSq0r1kP7lQziot7HhySz8XJ1Axm
         yaJJADwCP2P2IllTZrzxJTIpQRKBJsPLvvbE2p/kt4m2+mBhC+kz/Ot/cFQ/kpqIlVVb
         jOJBcGzY9yh25fiVLskWHL94lGpGaoMj2bdHGQPKkiuvX/3pcnQ2wbvi5jKIgA40e7JC
         zW41KH88IODnorsWErVHFNdK06gg3qm+mOGGjHRvLaOHCmi8k9s2Qe4bd996IP58Ommw
         XwEw==
X-Gm-Message-State: AFuF++lbXFe9sbSY1SDZlEkXj0ug1HXwf3ehlMYT8f57s4D+M0rDqTiG
	D5Yvc/kTRrfei+ihnd71t4mKVFOy1sZ/4NCS69Zdjns77EEcceVjMYzsNaXYy3OmKN7GLJeQ/qV
	jzlXg6R/hT6eN8yK/Djml7GyxPyWwBz0=
X-Gm-Gg: AYBFou0eE29ufkS7OBQ73HycEFdQP8uho1fb3njEbbx+m7ELGJhp16gmKKUvh+tTKzX
	6ge+aJYyybnZSHWI+D+boHCkJl9+r+kbvk24oTJ1pp4M1TZ/9IwpLcZ9hFI8cbgbH90hXOPzxkO
	b5mt7P+hEzxjotuV2NMdvdzT3O7k/O7jVQKn2tOY0sq9kmNL7luzYEjTVkMHut9S2f64OToQME/
	pDY01cfC2qTL5psHvpxQ2+X902g8NHkqKcKDCHZz8KhVgblIgzXk2mDgnO8+/NgLLbgcKfOYnVx
	uo0PxD8XqA1loRCd5d9KHGXrEqH3Ozax8VyG3gCGPT3VCxPBc9QDuyCFiL51qHKq4bqjR8dTw1V
	9yYMrWBMn2XhnPHGIPul1UxJGb7CykvoduaZWAtYypEoz3rIqPPQijG4nFuOUh0msAkT5vTNQJg
	w9oScpCHyqYucBx/osFfyRH72NR6f5wSB7PEHbmuzM9j4irufv1Iz0YRFzipNFdIwypKZBAWMBh
	B/W8ToGCXXC8GjELbwaMi1CuRp0DszEs3iakBH2nZ84MrjXBWs=
X-Received: by 2002:a17:907:7b98:b0:c29:f5d8:9c7d with SMTP id
 a640c23a62f3a-c29f5d89d16mr64824466b.44.1789594544347; Wed, 16 Sep 2026
 14:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andres Berbescu <aberbescu@gmail.com>
Date: Wed, 16 Sep 2026 23:35:32 +0200
X-Gm-Features: AcwNN1XR6-OvyJ7V3cyRoB17VU00u6zsaJKvy_QZ3VFUNWYJmPQeSPC91jcv8gY
Message-ID: <CAAOipkaT5tDsf-FtP0hC0iUG2fEe0PowqeQfV4m-cuooJeZX2w@mail.gmail.com>
Subject: [SECURITY] io_uring: provided-buffer ownership loss across
 MSG_WAITALL retry
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org, sashal@kernel.org, gregkh@linuxfoundation.org, 
	security@kernel.org
Content-Type: multipart/mixed; boundary="0000000000001bd91f065ba073de"

--0000000000001bd91f065ba073de
Content-Type: multipart/alternative; boundary="0000000000001bd91d065ba073dc"

--0000000000001bd91d065ba073dc
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting one io_uring provided-buffer ownership/accounting bug with
two MSG_WAITALL manifestations: bundle-tail reuse and incremental-buffer
reuse. The two cases violate the same invariant and should be handled as
one report.

Invariant and root cause

No provided-buffer region may be published or allocated to request B while
request A retains an iterator that can later write to it.

During a positive partial MSG_WAITALL receive, io_net_kbuf_recyle() commits
only the current prefix and consumes REQ_F_BUFFERS_COMMIT while the
persistent iterator still names the remainder. Retry continues without
reselection, and terminal completion has no remaining buffer-list ownership
token. In the incremental case, the retained-buffer result from commit is
also discarded.

Consequently, request B can be allocated a region that request A can still
write during its later retry.

Affected range

The bundle feature begins at v6.10 (2f9c9515bdfd), and incremental pbuf
consumption begins at v6.12 (ae98dbf43d75). The submission-relevant
residual begins upstream at v6.17 (41b70df5b38) and in stable 6.12 at
v6.12.44 (fe9da1812f86). It remains present through stable v6.12.110 and
tested mainline f6e7b42bf05b2427fb8a7a1d1c387a86638bb413.

Validation

Both manifestations reproduced 20/20 on each of these unmodified targets:

   - Debian 6.12.107
   - upstream stable 6.12.110
   - mainline f6e7b42bf05b2427fb8a7a1d1c387a86638bb413

Kernel-side tracing records request identity, group, bid, head/tail,
iterator range, commit token and CQE publication. It proves that A still
has write capability when the same physical range is assigned to B. A
minimal diagnostic patch removed both manifestations in 40/40 runs.
Different-group and single-request controls removed the collision in 20/20
runs each.

All runs used UID/EUID 1000, group 1000 only, CapEff=0, and no namespace,
capability, SQPOLL, module or privileged socket option.

Observed impact

The demonstrated effect is deterministic integrity damage inside the
caller's registered userspace pbuf pool. In bundle mode, A can overwrite
4096 bytes assigned to B or produce a 100-byte-A/3996-byte-B mixed record.
In incremental mode, B overwrites 40 bytes already delivered by A.

I am not claiming kernel-memory corruption, arbitrary write, cross-mm or
cross-principal access, confidentiality loss, availability loss, or
privilege escalation.

Duplicate assessment

This is an incomplete-fix/variant of CVE-2025-38730, not a new defect
class. It is code-level distinct from CVE-2026-53191; the CVE-2026-53191
fix is present in every kernel where this report reproduces and does not
repair the ownership transition described above.

Reproducer and evidence

A combined standalone package contains both source reproducers and causal
controls. Complete raw evidence, manifests, kernel traces, the comparison
with CVE-2026-53191, and the diagnostic patch are available privately on
request.

AI assistance was used during analysis and report preparation. In
accordance with the current kernel reporting guidance, I am treating the
issue as public and am not publishing the reproducers.

I will attach full report, please if you consider that full PoC + evidence
is needed just let me know. Thanks

--0000000000001bd91d065ba073dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello,</p>
<p>I am reporting one io_uring provided-buffer ownership/accounting bug wit=
h two
MSG_WAITALL manifestations: bundle-tail reuse and incremental-buffer reuse.
The two cases violate the same invariant and should be handled as one repor=
t.</p>
<p>Invariant and root cause</p>
<p>No provided-buffer region may be published or allocated to request B whi=
le
request A retains an iterator that can later write to it.</p>
<p>During a positive partial MSG_WAITALL receive, io_net_kbuf_recyle() comm=
its
only the current prefix and consumes REQ_F_BUFFERS_COMMIT while the persist=
ent
iterator still names the remainder. Retry continues without reselection, an=
d
terminal completion has no remaining buffer-list ownership token. In the
incremental case, the retained-buffer result from commit is also discarded.=
</p>
<p>Consequently, request B can be allocated a region that request A can sti=
ll
write during its later retry.</p>
<p>Affected range</p>
<p>The bundle feature begins at v6.10 (2f9c9515bdfd), and incremental pbuf
consumption begins at v6.12 (ae98dbf43d75). The submission-relevant residua=
l
begins upstream at v6.17 (41b70df5b38) and in stable 6.12 at v6.12.44
(fe9da1812f86). It remains present through stable v6.12.110 and tested
mainline f6e7b42bf05b2427fb8a7a1d1c387a86638bb413.</p>
<p>Validation</p>
<p>Both manifestations reproduced 20/20 on each of these unmodified targets=
:</p>
<ul>
<li>Debian 6.12.107</li>
<li>upstream stable 6.12.110</li>
<li>mainline f6e7b42bf05b2427fb8a7a1d1c387a86638bb413</li>
</ul>
<p>Kernel-side tracing records request identity, group, bid, head/tail, ite=
rator
range, commit token and CQE publication. It proves that A still has write
capability when the same physical range is assigned to B. A minimal diagnos=
tic
patch removed both manifestations in 40/40 runs. Different-group and
single-request controls removed the collision in 20/20 runs each.</p>
<p>All runs used UID/EUID 1000, group 1000 only, CapEff=3D0, and no namespa=
ce,
capability, SQPOLL, module or privileged socket option.</p>
<p>Observed impact</p>
<p>The demonstrated effect is deterministic integrity damage inside the cal=
ler&#39;s
registered userspace pbuf pool. In bundle mode, A can overwrite 4096 bytes
assigned to B or produce a 100-byte-A/3996-byte-B mixed record. In incremen=
tal
mode, B overwrites 40 bytes already delivered by A.</p>
<p>I am not claiming kernel-memory corruption, arbitrary write, cross-mm or
cross-principal access, confidentiality loss, availability loss, or privile=
ge
escalation.</p>
<p>Duplicate assessment</p>
<p>This is an incomplete-fix/variant of CVE-2025-38730, not a new defect cl=
ass.
It is code-level distinct from CVE-2026-53191; the CVE-2026-53191 fix is
present in every kernel where this report reproduces and does not repair th=
e
ownership transition described above.</p>
<p>Reproducer and evidence</p>
<p>A combined standalone package contains both source reproducers and causa=
l
controls. Complete raw evidence, manifests, kernel traces, the comparison w=
ith
CVE-2026-53191, and the diagnostic patch are available privately on request=
.</p>
<p>AI assistance was used during analysis and report preparation. In accord=
ance
with the current kernel reporting guidance, I am treating the issue as publ=
ic
and am not publishing the reproducers.</p><p>I will attach full report, ple=
ase if you consider that full PoC=C2=A0+ evidence is needed just let me kno=
w. Thanks</p></div>

--0000000000001bd91d065ba073dc--
--0000000000001bd91f065ba073de
Content-Type: text/markdown; charset="UTF-8"; name="report.md"
Content-Disposition: attachment; filename="report.md"
Content-Transfer-Encoding: base64
Content-ID: <f_mu4mdb4y0>
X-Attachment-Id: f_mu4mdb4y0

IyBLUk4tMjAyNi0wMDEvMDAyIOKAlCBpb191cmluZyBgTVNHX1dBSVRBTExgIHJldHJ5IGxvc2Vz
IHByb3ZpZGVkLWJ1ZmZlciBvd25lcnNoaXAKClRyYWNrOiBgaW9fdXJpbmdgCgojIyBTdW1tYXJ5
CgpgaW9fdXJpbmdgIGNhbiBwdWJsaXNoIG9yIHJlYWxsb2NhdGUgYSBwcm92aWRlZC1idWZmZXIg
cmFuZ2Ugd2hpbGUgYW4gZWFybGllcgpgSU9SSU5HX09QX1JFQ1ZgIHN0aWxsIGhhcyBhIHBlcnNp
c3RlbnQgaXRlcmF0b3IgY2FwYWJsZSBvZiB3cml0aW5nIGl0LiBUaGUKdHJpZ2dlciBpcyBhIHBv
c2l0aXZlIHBhcnRpYWwgYE1TR19XQUlUQUxMYCByZWNlaXZlLiBUaGUgcmV0cnkgaGVscGVyIGNv
bW1pdHMKb25seSB0aGF0IGludGVybmFsIHJlY2VpdmUncyBwcmVmaXgsIGNvbnN1bWVzIHRoZSBy
ZXF1ZXN0J3Mgb25lLXNob3QKYFJFUV9GX0JVRkZFUlNfQ09NTUlUYCB0b2tlbiwgYW5kIHJldHVy
bnMgYC1FQUdBSU5gLiBUaGUgcmV0cnkgcmV1c2VzIHRoZQpleGlzdGluZyBpdGVyYXRvciB3aXRo
b3V0IHJlc2VsZWN0aW5nLCBhbmQgdGVybWluYWwgY29tcGxldGlvbiBoYXMgbm8gYnVmZmVyCmxp
c3QvdG9rZW4gd2l0aCB3aGljaCB0byByZWNvbmNpbGUgdGhlIHJlbWFpbmluZyBieXRlcy4KClRo
aXMgcHJvZHVjZXMgdHdvIG1hbmlmZXN0YXRpb25zIG9mIG9uZSByb290IGNhdXNlOgoKMS4gV2l0
aCBhIG5vbi1pbmNyZW1lbnRhbCBidW5kbGUsIHRoZSBzaG9ydCBwcmVmaXggYWR2YW5jZXMgdGhl
IGhlYWQgb3ZlciBvbmx5CiAgIHRoZSBmaXJzdCBwaHlzaWNhbCBlbnRyeS4gVGhlIHVuZmlsbGVk
IG1hcHBlZCB0YWlsIGJlY29tZXMgc2VsZWN0YWJsZSBieQogICByZXF1ZXN0IEIgd2hpbGUgcmVx
dWVzdCBBIGNhbiBzdGlsbCB3cml0ZSBpdC4KMi4gV2l0aCBhbiBpbmNyZW1lbnRhbCBlbnRyeSwg
b25seSB0aGUgZmlyc3QgaW50ZXJuYWwgcmVjZWl2ZSBhZHZhbmNlcyB0aGUKICAgZGVzY3JpcHRv
ci4gQSBjb21wbGV0ZXMgbGF0ZXIgd2l0aG91dCBjaGFyZ2luZyBzdWJzZXF1ZW50IGJ5dGVzIG9y
IHNldHRpbmcKICAgYElPUklOR19DUUVfRl9CVUZfTU9SRWA7IHJlcXVlc3QgQiBpcyB0aGVuIGFs
bG9jYXRlZCBhIHJhbmdlIHdob3NlIGJ5dGVzIEEncwogICBDUUUgYWxyZWFkeSBkZWxpdmVyZWQu
CgpLZXJuZWwgdHJhY2luZyBkaXJlY3RseSBwcm92ZXMgQSdzIGxpdmUgaXRlcmF0b3IgYW5kIEIn
cyBhbGxvY2F0aW9uIG5hbWUgdGhlCnNhbWUgYWRkcmVzc2VzLiBPbiB1bm1vZGlmaWVkIERlYmlh
biA2LjEyLjEwNywgc3RhYmxlIDYuMTIuMTEwIGFuZCBjdXJyZW50Cm1haW5saW5lIGBmNmU3YjQy
YmYwNWJgLCBlYWNoIG1hbmlmZXN0YXRpb24gcmVwcm9kdWNlZCAyMC8yMC4gQSBtaW5pbWFsCmRp
YWdub3N0aWMgcGF0Y2ggdGhhdCByZWNvbmNpbGVzIHRoZSBjb21wbGV0ZSBzZWxlY3RlZCBleHRl
bnQgYXQgdGhlIHJldHJ5CnRyYW5zaXRpb24gcmVtb3ZlZCBib3RoIGluIDQwLzQwIHJ1bnMuCgpD
bGFzc2lmaWNhdGlvbjogKipJTkNPTVBMRVRFLUZJWCAvIFZBUklBTlQgb2YgQ1ZFLTIwMjUtMzg3
MzAqKi4gSXQgaXMgbm90IGEKZHVwbGljYXRlIG9mIENWRS0yMDI2LTUzMTkxLCBhbmQgS1JOLTIw
MjYtMDAxLzAwMiBzaG91bGQgcmVjZWl2ZSBvbmUgY29vcmRpbmF0ZWQKc3VibWlzc2lvbiByYXRo
ZXIgdGhhbiB0d28gQ1ZFcy4KCiMjIFNlY3VyaXR5IGltcGFjdAoKVGhlIGRlbW9uc3RyYXRlZCBw
cmltaXRpdmUgaXMgZGV0ZXJtaW5pc3RpYyBpbnRlZ3JpdHkgY29ycnVwdGlvbiBpbnNpZGUgdGhl
CnJpbmcgb3duZXIncyByZWdpc3RlcmVkIHVzZXJzcGFjZSBidWZmZXIgcG9vbDoKCi0gYnVuZGxl
OiBCIGNvbXBsZXRlcyBpbnRvIGEgNDA5Ni1ieXRlIGVudHJ5IGFuZCBwdWJsaXNoZXMgaXRzIGJp
ZDsgYWZ0ZXIgdGhhdAogIENRRSwgQSBvdmVyd3JpdGVzIGFsbCA0MDk2IEIgYnl0ZXMuIEEgcmV2
ZXJzZS1jb21wbGV0aW9uIGNhc2UgbGVhdmVzIG9uZQogIENRRS1uYW1lZCBlbnRyeSBjb250YWlu
aW5nIDEwMCBieXRlcyBmcm9tIEEgYW5kIDM5OTYgZnJvbSBCOwotIGluY3JlbWVudGFsOiBBIGNv
bXBsZXRlcyAxMDAgYnl0ZXMgYWZ0ZXIgaW50ZXJuYWwgcmVjZWl2ZXMgb2YgNjAgYW5kIDQwOwog
IEIgaXMgYWxsb2NhdGVkIGF0IG9mZnNldCA2MCBhbmQgb3ZlcndyaXRlcyBleGFjdGx5IEEncyBk
ZWxpdmVyZWQgYnl0ZXMKICA2MC4uOTkuCgpObyBrZXJuZWwtbWVtb3J5IHdyaXRlLCBvdXQtb2Yt
Ym91bmRzIGtlcm5lbCBhY2Nlc3MsIGFyYml0cmFyeSB3cml0ZSwKY3Jvc3MtYG1tYCBvciBjcm9z
cy1wcmluY2lwYWwgbXV0YXRpb24sIGNvbmZpZGVudGlhbGl0eSBsb3NzLCBhdmFpbGFiaWxpdHkK
bG9zcywgcHJpdmlsZWdlIGVzY2FsYXRpb24gb3IgTFBFIGlzIGRlbW9uc3RyYXRlZCBvciBjbGFp
bWVkLiBUaGUgc2VsZWN0ZWQKaXRlcmF0b3JzIHJlbWFpbiB1c2Vyc3BhY2UgaXRlcmF0b3JzIG92
ZXIgbWVtb3J5IHJlZ2lzdGVyZWQvY2hvc2VuIGJ5IHRoZSBzYW1lCnJpbmcgb3duZXIuCgojIyBS
ZWFjaGFiaWxpdHkgYW5kIHByZWNvbmRpdGlvbnMKCi0gb3JkaW5hcnkgbG9jYWwgVUlEL0VVSUQg
MTAwMCwgYENhcEVmZj0wYCwgbm8gcHJpdmlsZWdlZCBncm91cHM7Ci0gYENPTkZJR19JT19VUklO
Rz15YCwgaW9fdXJpbmcgZW5hYmxlZCAoYGtlcm5lbC5pb191cmluZ19kaXNhYmxlZD0wYCk7Ci0g
cmVnaXN0ZXJlZCBwcm92aWRlZC1idWZmZXIgcmluZyBhbmQgYElPU1FFX0JVRkZFUl9TRUxFQ1Rg
OwotIGBJT1JJTkdfT1BfUkVDVmAgb24gYEFGX1VOSVhgIGBTT0NLX1NUUkVBTWAgd2l0aCBgTVNH
X1dBSVRBTExgOwotIGZvciBLUk4tMDAxOiBgSU9SSU5HX1JFQ1ZTRU5EX0JVTkRMRWAsIG5vbi1p
bmNyZW1lbnRhbCBlbnRyaWVzIGFuZCBhdCBsZWFzdAogIHR3byBtYXBwZWQgZW50cmllczsKLSBm
b3IgS1JOLTAwMjogb25lIGluY3JlbWVudGFsIChgSU9VX1BCVUZfUklOR19JTkNgKSBlbnRyeSBy
ZXRhaW5lZCBieSBpdHMKICBgbWluX2xlZnRgIHBvbGljeTsKLSBhIHBvc2l0aXZlIHBhcnRpYWwg
cmVjZWl2ZSBmb2xsb3dlZCBieSBhIHJldHJ5LCBwbHVzIGEgbGF0ZXIgcmVjZWl2ZSBvbiB0aGUK
ICBzYW1lIGdyb3VwLgoKTm8gbmFtZXNwYWNlLCBjYXBhYmlsaXR5LCBrZXJuZWwgbW9kdWxlLCBk
ZXZpY2UsIHByaXZpbGVnZWQgc29ja2V0IG9wdGlvbiwKcmVnaXN0ZXJlZCBmaXhlZCBidWZmZXIs
IFNRUE9MTCBvciByYWNlIGlzIHJlcXVpcmVkLgoKIyMgUm9vdCBjYXVzZQoKT24gc3RhYmxlIDYu
MTIuMTEwOgoKMS4gYGlvX3JlY3YoKWAgaW1wb3J0cyBwcm92aWRlZCBidWZmZXJzIGFuZCBhIHBl
cnNpc3RlbnQgaXRlcmF0b3IKICAgKGBpb191cmluZy9uZXQuYzoxMTk1LTEyMDRgKS4KMi4gQSBw
b3NpdGl2ZSByZXN1bHQgc21hbGxlciB0aGFuIHRoZSBgTVNHX1dBSVRBTExgIG1pbmltdW0gZW50
ZXJzIHRoZSByZXRyeQogICBwYXRoIChgbmV0LmM6MTIwOS0xMjI0YCkuCjMuIGBpb19uZXRfa2J1
Zl9yZWN5bGUoKWAgc2V0cyBgUkVRX0ZfQkxfTk9fUkVDWUNMRWAgYW5kIGNvbW1pdHMgb25seSBg
bGVuYCwgdGhlCiAgIGN1cnJlbnQgaW50ZXJuYWwgcmVjZWl2ZSdzIGJ5dGVzIChgbmV0LmM6NTAz
LTUxMGApLgo0LiBgaW9fa2J1Zl9jb21taXQoKWAgY2xlYXJzIGBSRVFfRl9CVUZGRVJTX0NPTU1J
VGAgYmVmb3JlIGFkdmFuY2luZyB0aGUgaGVhZAogICBvciBpbmNyZW1lbnRhbCBkZXNjcmlwdG9y
IChgaW9fdXJpbmcva2J1Zi5jOjYyLTc1YCkuIFRoaXMgdG9rZW4gY2Fubm90IGJlCiAgIHVzZWQg
YWdhaW4uCjUuIGBSRVFfRl9CVUZGRVJfUklOR2AgcHJldmVudHMgcmUtc2VsZWN0aW9uIGFuZCBg
UkVRX0ZfQkxfTk9fUkVDWUNMRWAgcHJldmVudHMKICAgcm9sbGJhY2sgKGBpb191cmluZy9rYnVm
Lmg6MTM0LTE0OWApLiBUaGUgaXRlcmF0b3IgbmV2ZXJ0aGVsZXNzIHBlcnNpc3RzLgo2LiBUaGUg
bmV4dCBpc3N1ZSBiZWdpbnMgd2l0aCBgc2VsLmJ1Zl9saXN0PU5VTExgOyB0ZXJtaW5hbAogICBg
X19pb19wdXRfa2J1Zl9yaW5nKClgIHRoZXJlZm9yZSBza2lwcyBjb21taXQgKGBrYnVmLmM6Mzgw
LTQxMGApLgo3LiBGb3IgaW5jcmVtZW50YWwgZW50cmllcywgdGhlIGZhbHNlIHJldHVybiBmcm9t
IGBpb19rYnVmX2luY19jb21taXQoKWAgbWVhbnMKICAgdGhlIGVudHJ5IHdhcyByZXRhaW5lZCwg
YnV0IHRoZSByZXRyeSBoZWxwZXIgZGlzY2FyZHMgaXQgYW5kIGRvZXMgbm90IGxhdGNoCiAgIGBS
RVFfRl9CVUZfTU9SRWAgKGBrYnVmLmM6MzUtNTlgKS4KClRoZSB2aW9sYXRlZCBpbnZhcmlhbnQg
aXM6Cgo+IE5vIHByb3ZpZGVkLWJ1ZmZlciByYW5nZSBtYXkgYmUgcHVibGlzaGVkIG9yIGFsbG9j
YXRlZCB0byByZXF1ZXN0IEIgd2hpbGUKPiByZXF1ZXN0IEEgcmV0YWlucyBhbiBpdGVyYXRvciB0
aGF0IGNhbiBzdWJzZXF1ZW50bHkgd3JpdGUgdGhhdCByYW5nZS4KCiMjIEtlcm5lbC1zaWRlIG93
bmVyc2hpcCBwcm9vZgoKIyMjIEJ1bmRsZSBtYW5pZmVzdGF0aW9uCgpgYGB0ZXh0CkEgc2VsZWN0
OiBoZWFkPTAsIGlvdlswXT1iYXNlLzQwOTYsIGlvdlsxXT1iYXNlKzQwOTYvNDA5NgpBIHNob3J0
IHJlc3VsdDogbGVuPTEwMCwgaXRlcmF0b3JfcmVtYWluaW5nPTgwOTIsIGNvbW1pdD0xCkEgY29t
bWl0OiBoZWFkIDAtPjEsIGNvbW1pdD0wCkIgYWxsb2NhdGlvbi9jb21taXQ6IGFkZHI9YmFzZSs0
MDk2LCBoZWFkIDEtPjIKQiBDUUU6IHJlcz00MDk2LCBiaWQ9MQpBIHRlcm1pbmFsIENRRTogcmVz
PTgxOTIsIGJsPU5VTEwsIGNvbW1pdD0wCmBgYAoKQ2FuYXJpZXMgc2hvdyBlbnRyeSAxIGNoYW5n
aW5nIGZyb20gemVybywgdG8gNDA5NiBgQmAgYnl0ZXMgYWZ0ZXIgQidzIENRRSwgdG8KNDA5NiBg
QWAgYnl0ZXMgYWZ0ZXIgQSByZXN1bWVzLgoKIyMjIEluY3JlbWVudGFsIG1hbmlmZXN0YXRpb24K
CmBgYHRleHQKQSBzZWxlY3Q6IGJpZD0wLCBoZWFkPTAsIGRlc2NyaXB0b3I9YmFzZS84MTkyLCBy
ZXF1ZXN0ZWQ9MTAwCkEgc2hvcnQgcmVzdWx0OiBsZW49NjAsIGl0ZXJhdG9yX3JlbWFpbmluZz00
MCwgY29tbWl0PTEKQSBjb21taXQ6IGhlYWQgMC0+MCwgZGVzY3JpcHRvcj1iYXNlKzYwLzgxMzIs
IHJldHVybj1mYWxzZSwgY29tbWl0PTAKQSBDUUU6IHJlcz0xMDAsIGNmbGFncz0weDEgKEJVRl9N
T1JFIGFic2VudCksIGJsPU5VTEwKQiBzZWxlY3Q6IGJpZD0wLCBoZWFkPTAsIGFkZHI9YmFzZSs2
MCwgcmVxdWVzdGVkPTEwMApCIGNvbW1pdDogZGVzY3JpcHRvcj1iYXNlKzE2MC84MDMyCkIgQ1FF
OiByZXM9MTAwLCBjZmxhZ3M9MHgxMQpgYGAKCkNhbmFyaWVzIHNob3cgYFswLDEwMCk9QWAgYXQg
QSdzIENRRSBhbmQgYFs2MCwxNjApPUJgIGF0IEIncyBDUUUsIHByb3ZpbmcgdGhlCjQwLWJ5dGUg
cG9zdC1DUUUgb3ZlcndyaXRlLgoKIyMgUmVwcm9kdWN0aW9uIG1hdHJpeAoKfCBLZXJuZWwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgQnVuZGxlIHwgSW5jcmVtZW50YWwgfCBWZXJk
aWN0ICAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSB8IC0tLS0tLTp8IC0tLS0tLS0tLS0tOnwgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0gfAp8IERlYmlhbiBgNi4xMi4xMDcrZGViMTMtY2xvdWQtYW1kNjRgICAg
fCAyMC8yMCAgfCAyMC8yMCAgICAgICB8IFZVTE5FUkFCTEUgICAgICAgICAgICAgICAgICAgICAg
IHwKfCBzdGFibGUgYDYuMTIuMTEwYCAgICAgICAgICAgICAgICAgICAgIHwgMjAvMjAgIHwgMjAv
MjAgICAgICAgfCBWVUxORVJBQkxFICAgICAgICAgICAgICAgICAgICAgICB8CnwgbWFpbmxpbmUg
YGY2ZTdiNDJiZjA1YmAgKGA3LjMuMC1yYzNgKSB8IDIwLzIwICB8IDIwLzIwICAgICAgIHwgVlVM
TkVSQUJMRSAgICAgICAgICAgICAgICAgICAgICAgfAp8IHN0YWJsZSBgNi4xMi4xMTBgICsgZGlh
Z25vc3RpYyBwYXRjaCAgfCAwLzIwICAgfCAwLzIwICAgICAgICB8IE5PVCBWVUxORVJBQkxFIHRv
IHRlc3RlZCB0cmlnZ2VyIHwKCkVhY2ggcnVuIHVzZWQgYSBmcmVzaCBEZWJpYW4gS1ZNIGJvb3Qg
YW5kIHJlY29yZGVkIGBpZGAsIGB1bmFtZWAsIE9TIHJlbGVhc2UsCmlvX3VyaW5nIHN5c2N0bCwg
cmVsZXZhbnQga2VybmVsIGNvbmZpZywgYENhcEVmZmAsIGJvb3QgSUQsIGZ1bGwgc2VyaWFsIG91
dHB1dCwKZG1lc2csIGNvbW1hbmRzLCBydW50aW1lLCBQb0Mgb3V0cHV0IGFuZCBoYXNoZXMuIEFs
bCBub3JtYWwgcnVucyB3ZXJlIFVJRCAxMDAwCndpdGggemVybyBlZmZlY3RpdmUgY2FwYWJpbGl0
aWVzLgoKQWRkaXRpb25hbCBuZWdhdGl2ZSBjb250cm9scyByZW1vdmUsIG9uZSBhdCBhIHRpbWUs
IGBNU0dfV0FJVEFMTGAsIGJ1bmRsZSBtb2RlLAppbmNyZW1lbnRhbCBtb2RlLCBwcm92aWRlZC1i
dWZmZXIgc2VsZWN0aW9uLCBwYXJ0aWFsIGNvbXBsZXRpb24sIHNoYXJlZCBncm91cCwKYW5kIHJl
cXVlc3QgQi4gVGhlIHNlcGFyYXRlLWdyb3VwIGFuZCBzaW5nbGUtcmVxdWVzdCBjb250cm9scyBw
YXNzIDIwLzIwIGVhY2guClRoZSBmaW5hbCBjbGVhbi1ndWVzdCBgc3RhcnR1cC5zaGAgYW5kIGBl
eHBsb2l0LnNoYCBwYWNrYWdlIHJ1bnMgZXhpdCB6ZXJvLgoKIyMgRHVwbGljYXRlIGFuYWx5c2lz
CgojIyMgQ1ZFLTIwMjUtMzg3MzAKClVwc3RyZWFtIGNvbW1pdCBgNDFiNzBkZjViMzhiYzgwOTY3
ZDJlMGVkNTVjYzNjMzg5NmJiYTc4MWAgYWRkZWQgdGhlCnBhcnRpYWwtYnVmZmVyIGNvbW1pdCBv
biByZXRyeS4gSXQgZml4ZXMgdGhlIG9yaWdpbmFsIHplcm8tY29tbWl0IHNwZWxsaW5nIGJ1dApj
b21taXRzIG9ubHkgdGhlIGN1cnJlbnQgcHJlZml4IGFuZCBjb25zdW1lcyB0aGUgb25seSB0b2tl
bi4gVGhlIHN0YWJsZSA2LjEyCmJhY2twb3J0IGBmZTlkYTE4MTJmODY5N2EzOGY3ZTMwOTkxZDU2
OGVjMTk5ZTE2MDU5YCBpcyBwcmVzZW50IGluIGV2ZXJ5IHRlc3RlZAo2LjEyIGtlcm5lbC4gVGhp
cyByZXBvcnQgaXMgdGhlcmVmb3JlIGFuIGluY29tcGxldGUtZml4IHJlc2lkdWFsIHdpdGggZGly
ZWN0CmNvZGUgYW5kIGR5bmFtaWMgZXZpZGVuY2UuCgojIyMgQ1ZFLTIwMjYtNTMxOTEKClVwc3Ry
ZWFtIGBlZDQ2ZjM5YzQ3ZWI1NTMwYTljMTYxNDgxYTIwODBkM2E4NjljZmFmYCBhbmQgc3RhYmxl
IDYuMTIKYGY0MDU3MGZkYTNmM2ExZjk2YWVhYTRhZWY2NjViYTI3NGIyODEwYjVgIHByZXNlcnZl
CmBJT1JJTkdfQ1FFX0ZfQlVGX01PUkVgIGFjcm9zcyBpbnRlcm5hbCBidW5kbGUgcmV0cmllcy4g
VGhleSBkbyBub3QgbW9kaWZ5IHRoZQpvd25lcnNoaXAgdHJhbnNpdGlvbiBhYm92ZS4gU3RhYmxl
IDYuMTIuMTA3LzExMCBhbmQgbWFpbmxpbmUgY29udGFpbiB0aGF0IGZpeApidXQgcmVwcm9kdWNl
IGJvdGggUG9Dcy4gRGV0YWlsZWQgY29tcGFyaXNvbiBpcyBpbiB0aGUgZXZpZGVuY2UgcGFja2Fn
ZS4KCiMjIFZlcnNpb24gcmFuZ2UKCi0gQnVuZGxlIHJlY2VpdmUgZW50ZXJlZCBpbiBgMmY5Yzk1
MTViZGZkZTllNGRmMWYzNTc4MjI4NDA3NGQzNjI1ZmY4YWAKICAoZmlyc3QgcmVsZWFzZSB2Ni4x
MCkuIFRoZSBicm9hZCBvd25lcnNoaXAgYnVnIGZhbWlseSBhZmZlY3RzIHY2LjEwIHRocm91Z2gK
ICBjdXJyZW50OyBiZWZvcmUgdGhlIDIwMjUgZml4IGl0IGlzIHRoZSBvcmlnaW5hbCBDVkUgYmVo
YXZpb3IuCi0gSW5jcmVtZW50YWwgcGJ1ZiBjb25zdW1wdGlvbiBlbnRlcmVkIGluCiAgYGFlOThk
YmY0M2Q3NTViNGUxMTFmY2QwODZlNTM5MzliZWYzZTlhMWFgIChmaXJzdCByZWxlYXNlIHY2LjEy
KSBhbmQgaXMKICBhZmZlY3RlZCB0aHJvdWdoIGN1cnJlbnQuCi0gVGhlIHNwZWNpZmljIHN1Ym1p
c3Npb24tcmVsZXZhbnQgcmVzaWR1YWwgYmVnaW5zIHVwc3RyZWFtIHdpdGggdGhlIHBhcnRpYWwK
ICByZXRyeSBmaXggKGZpcnN0IHJlbGVhc2UgdjYuMTcpIGFuZCBpbiBzdGFibGUgNi4xMiBhdCB2
Ni4xMi40NC4KLSBJdCBpcyBjb25maXJtZWQgdGhyb3VnaCBzdGFibGUgdjYuMTIuMTEwIGFuZCBt
YWlubGluZQogIGB2Ny4zLXJjMy02NC1nZjZlN2I0MmJmMDViYC4KLSBObyBmaXhlZCB1cHN0cmVh
bSBvciBzdGFibGUgcmVsZWFzZSB3YXMgZm91bmQuIFByZS1mZWF0dXJlIHJlbGVhc2VzIGFyZQog
IG5vbi1hZmZlY3RlZCBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgbWFuaWZlc3RhdGlvbjsgcHJlLXY2
LjE3IGZlYXR1cmUtYmVhcmluZwogIHJlbGVhc2VzIGFyZSBub3Qgc2FmZSBiZWNhdXNlIHRoZXkg
Y29udGFpbiB0aGUgb3JpZ2luYWwgQ1ZFIGNvbmRpdGlvbi4KCiMjIERpYWdub3N0aWMgZml4IGV4
cGVyaW1lbnQKClRoZSBwcmVzZXJ2ZWQgZGlhZ25vc3RpYyBwYXRjaCBjaGFuZ2VzIHRoZSByZXRy
eSBjaGFyZ2UgZnJvbSBgbGVuYCB0bwpgbGVuICsgaW92X2l0ZXJfY291bnQoaXRlcmF0b3IpYCBh
bmQgcHJvcGFnYXRlcyB0aGUgaW5jcmVtZW50YWwgY29tbWl0IHJlc3VsdAppbnRvIGBSRVFfRl9C
VUZfTU9SRWAuIEl0IGNoYW5nZXMgZXhhY3RseSB0aGUgc3VzcGVjdGVkIHRyYW5zaXRpb24gYW5k
IHJlbW92ZXMKYm90aCBQb0NzLiBJdCBpcyBub3QgcHJvcG9zZWQgYXMgdGhlIGZpbmFsIHVwc3Ry
ZWFtIHBhdGNoOiBtYWludGFpbmVycyBzaG91bGQKdmFsaWRhdGUgaW50ZWdlciB3aWR0aCwgcGFy
dGlhbCBtYXBwaW5ncywgY2FuY2VsbGF0aW9uIGFuZCBBUEkgc2VtYW50aWNzIGJlZm9yZQpjaG9v
c2luZyBiZXR3ZWVuIGZ1bGwgcmVzZXJ2YXRpb24sIHJldHJ5IHJlLXNlbGVjdGlvbiwgb3Igd2hv
bGUtZXh0ZW50IGNvbW1pdC4KCiMjIFJlcHJvZHVjdGlvbgoKSW5zaWRlIGEgZGlzcG9zYWJsZSBE
ZWJpYW4gS1ZNIGd1ZXN0IGFzIHRoZSBvcmRpbmFyeSB1c2VyOgoKYGBgc2gKdW56aXAgcG9jLnpp
cCAtZCBrcm4wMDEwMDIKY2Qga3JuMDAxMDAyCi4vc3RhcnR1cC5zaAouL2V4cGxvaXQuc2gKYGBg
Cgpgc3RhcnR1cC5zaGAgYnVpbGRzIGJvdGggcHJlc2VydmVkIGhhcm5lc3Nlcy4gYGV4cGxvaXQu
c2hgIHJ1bnMgYm90aCBwb3NpdGl2ZQpvcmFjbGVzIGFuZCB0aGVpciBwYWNrYWdlZCBjb250cm9s
cyBhbmQgZXhpdHMgbm9uemVybyBvbiBhbnkgbWlzc2luZyBQQVNTLApzdGRlcnIgb3V0cHV0LCBz
ZXR1cCBmYWlsdXJlIG9yIG9yYWNsZSBtaXNtYXRjaC4gSXQgcmVmdXNlcyBleGVjdXRpb24gb3V0
c2lkZSBhClZNIGFuZCByZWNvcmRzIHByZWNvbmRpdGlvbnMgYW5kIHJhdyBsb2dzLgoKIyMgQ1ZT
UyB2NC4wCgoqKjQuOCBNZWRpdW0qKgoKYGBgdGV4dApDVlNTOjQuMC9BVjpML0FDOkwvQVQ6Ti9Q
UjpML1VJOk4vVkM6Ti9WSTpML1ZBOk4vU0M6Ti9TSTpOL1NBOk4KYGBgCgpSYXRpb25hbGU6IGxv
Y2FsIGFjY2VzcyBhbmQgbG93IHByaXZpbGVnZXMgYXJlIHJlcXVpcmVkOyB0aGUgZGV0ZXJtaW5p
c3RpYwp0cmlnZ2VyIGhhcyBubyByYWNlIHByZXJlcXVpc2l0ZTsgdGhlIG9ubHkgZGVtb25zdHJh
dGVkIGVmZmVjdCBpcyBsb3cgaW50ZWdyaXR5Cmxvc3MgaW4gdGhlIGF0dGFja2VyJ3MvcmluZyBv
d25lcidzIHN1cHBsaWVkIHVzZXJzcGFjZSBwb29sLiBObyBzdWJzZXF1ZW50CnN5c3RlbSBpbXBh
Y3QgaXMgZGVtb25zdHJhdGVkLgoKIyAK
--0000000000001bd91f065ba073de--
