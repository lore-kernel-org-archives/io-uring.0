Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068959;
	b=KmiArRfEQnv7tqI15VjWif5Q1V5Re5KTOJTwvZ6kJmwCZZ7+Zna0dzaY/mx03tOp9nZm
	 ztW5UzC4RZPFsveP2PO/NMTA76eHkMTUMkixF0NhIjPA97C6VfjkbKTk1PBkUMVpiTAMT
	 RNwtKiPnJOyZVkSfSZF7MnMHEeHa00UtvF88n5GcMu0gYw8w/Fxt3zY9GVIFIJwrrZ4bM
	 wpqIt4dBSaMWqhE+eEB7B06SMNvuVB8BiW6mQyJhTT3+aqNVkhHbnH265l9XSu/30HqK7
	 dZplopOj819YTXOxosHXp2UmgvH3Mqe6jL4OaSCgBJ08AK8bZ5KJjM10k+TYGwqPS/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
	b=AdUZdLmDMyvnrx410fg0i2owrleeZShZBKAHDUa4l/sIMj+AivYSuXDW/nqQ7RqluBBY
	 9bO0wfkh6tSvVyGV+IGGhFbC6tgZ3KIL89j98zmVBSYtRRzO89HuklqTCQqJ++lpP5LiB
	 sWeb26JG9DKhgwESRq1ykjBEB5TONAlX1tLzU96q8aQHbUrx+z+QJiP8xEQwatXZhlsyW
	 E1+2rvzz/U1eTdh8S8ughyGQi2KGtU38CYhUPwgYflksucHuxOXCOqTST+V5GdJZDqjjv
	 ntr3j7bVTUt6svWqD3Ervk8EdAp3yLSp1KATNoje6g4ryl4la5krBqtPmQaj9GFIXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=nAMLJ4po;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DECD606A322
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 02:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DECD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=nAMLJ4po
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1846bc43c28so4071751c88.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793068957; x=1793673757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=nAMLJ4pov/UKnTCLgH305UyFiee1Kbb1n3tCzOl712VaepOkFQaBHOfe8TqG3p1lZU
         FcmqVqrrqUreTloBdzXh9C3S8RzvKdqK0Wdm3ymTtA2e7F8hg+g3tAXi0qMz5tjjKhfg
         XZsmI+gaR0xwl7nmIQiVOSWVXQuFdQ0nDSV/JTrdP8vh+zCmGEp4ByKhGzO7Q9EFAqG7
         Z9UxSRbzl1SyjYddPBfqeotnjUxiWUf5QMQHMI+2cHXwFS8e7Vcd6faApvoLAEI8hyVq
         H9p+0vB8HKXlTDO8gBcIdyEeUOqojMCpKudjjewsxrlbiMp0bSMq+X14CJGfZa/XuOHM
         djkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068957; x=1793673757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=pU5B6HFEf7+JQRNCKrNDdXWJ+buPy5OV9DHNXQWEF5KYvVOzXh71MGrJCrcvj6kO/k
         42extW9I/6Yz0gHp4vcdKyE1xsEFT+FvYJYVyHiOtM8qqnce4d8N297+i0U308VJPuAk
         8LWoiTyIG5dU4V/8QMUHwGZDUizZVXxFBaiobWrJk3cy1LUfuJeW49rXUG77G4RKOU3M
         pgoGm/vhivvtFTfh0bQH2MZajwPKH3E/96NNRUPIPl17cMyXheQRmpGa6AjZF3Y7NeX8
         J9pVhNWr9yFt/5u27PGmX3N12hM+FyKAK3SN4OtAsllvzRvS2+dyC2HHAseebZTXrPLd
         im4A==
X-Forwarded-Encrypted: i=1; AKwUvByoPtbGLT1HPpMspShvyTdCtxrLeuZKlvMWRpUGl9v8yi52EvbQoJ2GaDCb4+Ws7Xq+UYPa5DIAWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJil0tN9YU/cRx2AT3hBQM/dDMYnWEaPJoBmbZLTmlRvW+qcg5
	bUEJn7B5Ma3VAYRDSSmSYSBBzZ97RXS7eSkwCya9heBRMsbM3Moc8eB843fEqVKe5aI=
X-Gm-Gg: AYBFou1PiE4vfBNjgzDgROGyhlJT/oNRo4I8dywKfi6gpo3wW9MJj0k7Bh9i2w1miiI
	T2pljUe8MGN3D3+uvinbfxUC4UEbNGnDF02Fk3c2SBlarFXM/wl8KDKyUBKw5C4a0jf2hcehI7B
	wuSxR7NlK0uvNTzAG7z+xYrJQ5/PXxVDU2gBn28qOqxyAojaJPFhehKo2Gsuudm6EAV+pfrHH1n
	uQOQ3ctWTDkvE50SaRqoWKJkS4Fw0znmHFLzdqnqUJ7hCKAb9KRh+K6ajGz2jM76XTtJvXkkju5
	ChqDzpu1UTQCtVnXQ4ZY74anWGM6EnaOBrYQ6JHurJDAENp5e4obXQWnxv7NBFaROFq/HJ1g/pE
	rOMDqrqZLqbhhLWMavZ0yoFM2ndbTayLkQCH71LoRv/z9DlZsxlZn0cu0SHkAwQJsyObKX9cyO2
	cCQ6SFfkoWKN/d4O5KCuz5YkZVD2+hvXfCNXzqbckp/GNpdHQKDXd/auRqJ0VPgnnSR5od9DMbO
	DJdlJB+qpcptKsM8O0+tfgrjOQfagQL58cGTiMQIPVhaimVX/B/FWQnrnHf3P5GkYLT2/uytWV2
	0GkMT9tN4rr4Zo8Zk+6jswTweksklDxeVVSIj/8=
X-Received: by 2002:a05:701a:ca07:b0:144:fd7c:84fe with SMTP id a92af1059eb24-19937307669mr13761314c88.35.1793068957501;
        Mon, 26 Oct 2026 19:42:37 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm59514670c88.17.2026.10.26.19.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 19:42:36 -0700 (PDT)
Message-ID: <30b1cf28-61e6-4f28-8e28-79815bd87617@kernel.dk>
Date: Mon, 26 Oct 2026 20:42:35 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/10] btrfs: Don't copy encoded read data to user
 memory when canceled
To: James Houghton <jthoughton@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
 io-uring@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-btrfs@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-3-jthoughton@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261026215226.3713941-3-jthoughton@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

